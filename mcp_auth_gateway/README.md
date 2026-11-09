# MCP Auth Gateway

A Home Assistant OS app wrapper for [Sigbit MCP Auth Proxy](https://github.com/sigbit/mcp-auth-proxy). It adds OAuth authentication to **any existing HTTP MCP server**, without changing the server itself.

All credit for the authentication software belongs to the upstream developers. This repository packages the software for Home Assistant OS.

## How it works

```text
OAuth-capable MCP client (for example Gemini)
    | HTTPS
Nginx Proxy Manager
    | HTTP
MCP Auth Gateway (host port 9877)
    | HTTP
Existing MCP server (for example MCP Proxy on port 9876)
    | optional stdio transport
MCP tools
```

The gateway is **not** an MCP server manager: it authenticates clients and forwards requests to your existing MCP backend.

## Companion app: MCP Proxy

A useful companion is [MCP Proxy by slettmayer](https://github.com/slettmayer/home-assistant-apps/tree/main/mcp-proxy), which can launch stdio MCP servers and expose them over HTTP. Its default host port is **9876**; the authentication gateway uses **9877**. This companion is optional, not bundled.

### Example: Vinted

One tested configuration uses [andrijdavid/vinted-mcp](https://github.com/andrijdavid/vinted-mcp), built from upstream commit [`992d476`](https://github.com/andrijdavid/vinted-mcp/commit/992d476) (the search/item API fix), launched as a stdio server by MCP Proxy. The resulting endpoint is `/servers/vinted/mcp`. This is **an example only**: the gateway is not Vinted-specific.

## Installation

1. In Home Assistant, open **Settings > Apps > App store > ⋮ > Repositories**.
2. Add [this app repository](https://github.com/tschoehuijs/HomeAssistantApps) if it is not already present.
3. Refresh the store, open **MCP Auth Gateway**, and select **Install**.
4. Configure `external_url`, `backend_url`, and a unique password of at least 20 characters.
5. Start the app and follow [DOCS.md](DOCS.md) to verify protection before changing public routing.

## Configuration

| Option | Meaning |
| --- | --- |
| `external_url` | Public HTTPS origin of this gateway, without an endpoint path. |
| `backend_url` | Internal HTTP(S) origin of your existing MCP backend, without an endpoint path. |
| `password` | Unique password for OAuth login, at least 20 characters. |

The gateway listens on container port 8080, published as host port **9877** by default. Your backend may use any reachable port; **9876** is the default for the optional MCP Proxy app.

## Documentation and credits

- [Setup, validation, security, and troubleshooting](DOCS.md)
- [Sigbit MCP Auth Proxy](https://github.com/sigbit/mcp-auth-proxy)
- [Optional MCP Proxy app](https://github.com/slettmayer/home-assistant-apps/tree/main/mcp-proxy)
- [Example Vinted MCP server](https://github.com/andrijdavid/vinted-mcp)

## Warning: Use at your own risk

This experimental, personal-use app is provided **as-is** without warranties or guaranteed support. It was prepared with AI assistance and may contain errors. Protect app options, tokens, and backups; validate the complete OAuth and MCP tool flow before relying on it.

**Icons:** The included `icon.png` and `logo.png` are for Home Assistant. They do not configure the icon displayed by Gemini or other MCP clients.
