# MCP Auth Gateway documentation

This Home Assistant OS app adds OAuth authentication in front of an **existing HTTP MCP backend**. It is independent of the MCP tools and services behind that backend.

## Architecture

```text
OAuth-capable MCP client
    | HTTPS
Nginx Proxy Manager / HTTPS reverse proxy
    | HTTP
MCP Auth Gateway (HAOS host port 9877)
    | HTTP
Existing MCP backend (any reachable HTTP origin)
    | optional stdio bridge
MCP tools
```

### Optional companion: MCP Proxy (port 9876)

[MCP Proxy by slettmayer](https://github.com/slettmayer/home-assistant-apps/tree/main/mcp-proxy) is a separate Home Assistant app that runs stdio MCP servers and exposes their tools over HTTP. It typically publishes port **9876**, making it a useful backend for this gateway on **9877**. The gateway does not install or manage MCP Proxy. Other HTTP MCP backends work too.

### Example only: Vinted MCP

For a marketplace example, the companion MCP Proxy can launch [andrijdavid/vinted-mcp](https://github.com/andrijdavid/vinted-mcp) in stdio mode. The working configuration used upstream commit [`992d476`](https://github.com/andrijdavid/vinted-mcp/commit/992d476), which contains the Vinted search/item API route fix. When configured with the name `vinted`, MCP Proxy exposes it at `/servers/vinted/mcp`.

**This example is not a requirement.** Substitute your own MCP backend, server name, and endpoint path throughout these instructions.

## Install through Home Assistant

1. Confirm that your HTTP MCP backend already works locally. If using MCP Proxy, install it from [slettmayer/home-assistant-apps](https://github.com/slettmayer/home-assistant-apps) and follow its `servers.json` instructions.
2. In Home Assistant, open **Settings > Apps > App store > ⋮ > Repositories**.
3. Add [HomeAssistantApps](https://github.com/tschoehuijs/HomeAssistantApps), unless already installed.
4. Refresh the store, open **MCP Auth Gateway**, and select **Install**.
5. Set the three configuration options below, save, and start the app.
6. Validate locally before changing Nginx or reconnecting a public client.

## Configuration

Example values only; do not commit your actual hostname, LAN address, or password to a public repository:

```yaml
external_url: "https://mcp.example.com"
backend_url: "http://192.168.1.100:9876"
password: "REPLACE_WITH_UNIQUE_RANDOM_PASSWORD_AT_LEAST_20_CHARS"
```

- **`external_url`**: public HTTPS origin of the gateway, **without** `/mcp` or another endpoint path. OAuth discovery and login must use the same origin.
- **`backend_url`**: internal HTTP(S) origin of the existing MCP backend, **without** the MCP path. For the optional MCP Proxy, use your HAOS address and its published port `9876`. Other backends can use other ports.
- **`password`**: unique gateway login password, at least 20 characters. It is **not** a Vinted password, Nginx Basic Auth password, or OAuth Client ID/secret.

The gateway's published host port defaults to **9877** (container port 8080). Never set `backend_url` to the gateway's own public URL or port 9877: that would create a forwarding loop.

## Local validation

Replace `<HAOS-IP>` with your device's IP address.

### 1. Health

```sh
curl --silent --show-error --include --max-time 15 \
  'http://<HAOS-IP>:9877/healthz'
```

Expected: HTTP 200 with `{"status":"ok"}`. The `z` is intentional; it is the upstream health-check path. Health alone does not verify OAuth or tool execution.

### 2. Unauthenticated MCP request

Substitute your actual backend endpoint path; this example uses `/servers/vinted/mcp`:

```sh
curl --silent --show-error --include --max-time 15 \
  'http://<HAOS-IP>:9877/servers/vinted/mcp' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json, text/event-stream' \
  --data-raw '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-03-26","capabilities":{},"clientInfo":{"name":"auth-check","version":"1.0.0"}}}'
```

Expected: authentication rejection, normally HTTP **401**. Successful initialization without credentials means protection is not established. A 404 or 500 is not a passing security test.

## Public reverse proxy

Only after local tests succeed, route the **entire public hostname** through the gateway:

- Scheme: `http`
- Forward host: HAOS IP
- Forward port: `9877` (or your configured published port)
- SSL: valid certificate and Force SSL enabled

Do not leave public Nginx routes pointing directly to the unauthenticated backend. OAuth discovery and login paths must reach the gateway. Avoid layering HTTP Basic authentication unless your MCP client supports it.

Repeat the unauthenticated MCP initialization test over public HTTPS. It should still reject the request.

## Connect an OAuth-capable MCP client

Use your public HTTPS origin **plus the existing backend's MCP path**. For example:

```text
https://mcp.example.com/servers/vinted/mcp
```

Complete the OAuth authorization flow, then verify tool discovery and a real tool call. In clients such as Gemini, leave Client ID and Client secret blank initially if dynamic registration is offered. Do not enter the gateway password in those fields.

The gateway forwards the original backend path; it does not automatically rename MCP endpoints.

## Security and persistence

- Do not expose the backend port directly to the internet; local LAN access to the backend may remain unauthenticated.
- Keep the gateway password out of GitHub, logs, and screenshots. Replace any password that has been shared.
- OAuth state and signing material persist in the app's private `/data/oauth` directory. Protect backups.
- A masked password option is not necessarily encrypted at rest.
- Changing the login password does not necessarily revoke already-issued tokens; consult upstream for revocation behavior.
- Public HTTPS is encrypted; the default gateway-to-backend hop uses HTTP on your local network.

## Troubleshooting

| Symptom | Check |
| --- | --- |
| App not listed | Refresh the app store; confirm the repository and `config.yaml` are committed. |
| Health check fails | Gateway startup logs and port 9877 mapping. |
| Anonymous MCP initialization returns 401 | Expected; authentication is enforced. |
| Login works, MCP returns 404 | Confirm backend URL and path, then check whether the request reaches the backend logs. |
| Tool returns an upstream API error | Troubleshoot the MCP tool server independently of OAuth. |
| Public initialization succeeds anonymously | Look for Nginx routes bypassing the gateway. |
| Home Assistant icon is missing | Check `icon.png` and `logo.png` in the app folder and refresh the app store. |
| Gemini icon is missing | HAOS icon/logo files are not passed through as Gemini custom-app artwork. Gemini's custom-app icon handling is a separate client feature. |

## Credits and limitations

- Authentication: [Sigbit MCP Auth Proxy](https://github.com/sigbit/mcp-auth-proxy)
- Optional stdio-to-HTTP companion: [slettmayer MCP Proxy](https://github.com/slettmayer/home-assistant-apps/tree/main/mcp-proxy), based on [sparfenyuk/mcp-proxy](https://github.com/sparfenyuk/mcp-proxy)
- Example tool server: [andrijdavid/vinted-mcp](https://github.com/andrijdavid/vinted-mcp)

This experimental personal-use wrapper is provided as-is, without warranty or guaranteed support. Its Home Assistant icon and logo do **not** configure an MCP client's icon.
