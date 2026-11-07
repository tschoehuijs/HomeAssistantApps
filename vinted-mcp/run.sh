#!/bin/sh
set -eu

CONFIG=/data/options.json
BUNDLE=/usr/local/lib/node_modules/@andrijdavid/vinted-mcp/dist/bundle.js

export VINTED_MCP_TRANSPORT=http
export VINTED_MCP_HOST=0.0.0.0
export VINTED_MCP_PORT=3001
export VINTED_MCP_PATH=/mcp
export VINTED_MCP_ENABLE_LEGACY_SSE=false

export VINTED_AUTH_MODE="$(jq -r '.auth_mode // "http"' "$CONFIG")"
export VINTED_AUTH_COOKIES="$(jq -r '.auth_cookies // ""' "$CONFIG")"
export VINTED_AUTH_CSRF_TOKEN="$(jq -r '.auth_csrf_token // ""' "$CONFIG")"

# Patch upstream vinted-mcp stateless Streamable HTTP handling.
# Upstream creates one transport and reuses it for every request.
# Create a fresh server + transport for every /mcp request instead.
node <<'NODE'
const fs = require("fs");

const file = "/usr/local/lib/node_modules/@andrijdavid/vinted-mcp/dist/bundle.js";
let source = fs.readFileSync(file, "utf8");

const oldSetup = `  const streamableServer = createServer();
  const transport = new StreamableHTTPServerTransport({
    sessionIdGenerator: void 0,
    enableJsonResponse: true
  });
  await streamableServer.connect(transport);`;

const newSetup = `  const streamableServer = {
    close: async () => {}
  };`;

const oldHandler = `    if (url.pathname === path) {
      transport.handleRequest(req, res).catch((error) => {
        const message = error instanceof Error ? error.message : String(error);
        writeJsonError(res, 500, message);
      });
      return;
    }`;

const newHandler = `    if (url.pathname === path) {
      const requestServer = createServer();
      const requestTransport = new StreamableHTTPServerTransport({
        sessionIdGenerator: void 0,
        enableJsonResponse: true
      });
      try {
        await requestServer.connect(requestTransport);
        await requestTransport.handleRequest(req, res);
      } catch (error) {
        const message = error instanceof Error ? error.message : String(error);
        writeJsonError(res, 500, message);
      } finally {
        try {
          await requestTransport.close();
        } catch {
        }
        try {
          await requestServer.close();
        } catch {
        }
      }
      return;
    }`;

if (source.includes(oldHandler)) {
  if (!source.includes(oldSetup)) {
    console.error("[vinted-mcp] Patch failed: transport setup not found");
    process.exit(1);
  }

  source = source.replace(oldSetup, newSetup);
  source = source.replace(oldHandler, newHandler);
  fs.writeFileSync(file, source);

  console.log("[vinted-mcp] Applied Streamable HTTP stateless transport patch");
} else if (source.includes("const requestTransport = new StreamableHTTPServerTransport")) {
  console.log("[vinted-mcp] Streamable HTTP patch already applied");
} else {
  console.error("[vinted-mcp] Patch failed: upstream bundle has changed");
  process.exit(1);
}
NODE

exec vinted-mcp