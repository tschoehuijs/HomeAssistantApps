# Vinted MCP Server

## Overview

Home Assistant wrapper for [andrijdavid/vinted-mcp](https://github.com/andrijdavid/vinted-mcp), an **unofficial** Model Context Protocol (MCP) server for Vinted. It provides AI assistants with tools to search listings, inspect items and sellers, and compare prices. This app serves MCP requests; it does **not** provide a conventional browser dashboard.

## Configuration

| Option | Default | Description |
| --- | --- | --- |
| `auth_mode` | `http` | Upstream authentication mode. Choose `http` for anonymous search or `env` when supplying session credentials. |
| `auth_cookies` | Empty | Optional Vinted session cookie string. Treat as a secret. |
| `auth_csrf_token` | Empty | Optional Vinted CSRF token. Treat as a secret. |

The app listens on **port 3001 inside the container**. Home Assistant publishes this on **port 3002** by default; you can change the host port in the app's **Network** settings.

## Installation and usage

1. Install **Vinted MCP Server** from this repository's Home Assistant app store entry.
2. Review **Configuration** and **Network** settings.
3. Start the app and inspect its logs for startup errors.
4. Point a compatible MCP client to `http://YOUR_HOME_ASSISTANT_IP:3002/mcp` on your local network.
5. Test an anonymous listing search before configuring account credentials.

MCP uses HTTP requests, not a human-facing web page. Opening `/mcp` in a browser may return a method or protocol error even when the server is running.

### Remote access and Gemini

This wrapper does not provide HTTPS, OAuth, or MCP client authentication. **Do not forward port 3002 directly to the public internet.** Use an appropriately authenticated HTTPS gateway if your MCP client requires remote access. Compatibility with Gemini on the web or phone depends on the client's current custom MCP connector support and has not been validated for this wrapper.

## Updates

The `update-vinted-mcp.yml` workflow checks the upstream npm package daily and updates the app version and build argument when a new version is published. It creates a GitHub release. Install the resulting update in Home Assistant to rebuild the app; an upstream release does not automatically restart or update a running installation.

## Troubleshooting

- **Build error `npm: not found`:** Check that the Dockerfile installs `nodejs` and `npm` before installing the upstream package.
- **Port already in use:** Change the host port in the app's Network settings, leaving container port `3001` unchanged.
- **Connection refused:** Confirm the app started successfully and that the host port is published.
- **Authentication errors:** Start with anonymous searches; verify credentials only if account-specific functionality is needed.
- **Gemini cannot connect:** Check remote HTTPS access, authentication requirements, and whether your Gemini client supports custom remote MCP servers.

## Credits and license

Upstream: [andrijdavid/vinted-mcp](https://github.com/andrijdavid/vinted-mcp). See the [upstream license](https://github.com/andrijdavid/vinted-mcp/blob/main/LICENSE.md). Not affiliated with Vinted.
