# MCP Auth Gateway

Home Assistant app wrapper for [Sigbit MCP Auth Proxy](https://github.com/sigbit/mcp-auth-proxy), providing OAuth authentication in front of an existing HTTP MCP server.

All credit for the authentication software goes to the original project and its contributors. This repository provides the Home Assistant packaging only.

## Warning: Use at Your Own Risk

This app is intended for personal use and is provided "as-is" without warranties. It was developed with AI assistance and may contain errors or security vulnerabilities. You are using it entirely at your own risk. Support and fixes are not guaranteed.

This wrapper is experimental. Successful installation does not establish compatibility with every MCP client. Gemini authentication and tool execution must be tested before relying on this setup.

## Features

- OAuth authentication with password login.
- Protection for an existing HTTP MCP backend without changing its implementation.
- Persistent authentication state in the app's private data directory.
- HTTPS termination through an existing reverse proxy.
- ARM64 / aarch64 support, including Raspberry Pi 5.

## Installation

[![Add repository to Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Ftschoehuijs%2FHomeAssistantApps)

1. Add this repository using the button above, or follow the manual steps below.
2. Open **Settings > Apps > App store**. Older versions use **Add-ons > Add-on store**.
3. Find **MCP Auth Gateway** under this repository and select **Install**.
4. Open **Configuration** and set the public HTTPS origin, internal backend origin, and a unique password of at least 20 characters.
5. Save, then select **Start** and inspect the app log.
6. Follow the **Documentation** tab for local checks, reverse-proxy configuration, and client connection.

### Add the repository manually

1. Open the app store's three-dot menu and select **Repositories**.
2. Add [this repository](https://github.com/tschoehuijs/HomeAssistantApps).
3. Close the dialog and refresh the store or select **Check for updates**.
4. Select **MCP Auth Gateway > Install**.

If this repository is already installed, only refresh it to discover the new app. There is no need to install Docker or run the gateway manually.

## Configuration

| Option | Purpose |
| --- | --- |
| `external_url` | Public HTTPS origin routed to the gateway, without a path. |
| `backend_url` | Internal HTTP or HTTPS origin of the existing MCP server, without a path. |
| `password` | Unique login password, at least 20 characters. Set this in Home Assistant, not GitHub. |

The default published port is **9877**. The gateway listens on **8080** inside its container. Keep the existing backend running separately.

## Documentation

See [DOCS.md](DOCS.md) for setup, authentication checks, reverse-proxy routing, persistence, and troubleshooting.

## Upstream project

- [Sigbit MCP Auth Proxy](https://github.com/sigbit/mcp-auth-proxy)
- [Upstream documentation](https://sigbit.github.io/mcp-auth-proxy/)

The wrapper pins upstream release **v2.10.2** and verifies the downloaded ARM64 executable against a fixed SHA-256 during the build. Updating it requires updating both the release version and checksum.

The included icon and logo were generated with Microsoft Copilot. They identify the Home Assistant app; they do not configure the icon displayed by an MCP client.
