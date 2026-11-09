# MCP Auth Gateway documentation

This app adds an OAuth authentication layer in front of an existing HTTP MCP server. It does not install the backend server or provide marketplace tools itself.

All credit for the authentication software goes to [Sigbit MCP Auth Proxy](https://github.com/sigbit/mcp-auth-proxy). This experimental wrapper is provided for personal use, as-is, without guaranteed support.

## Requirements

- Home Assistant OS on aarch64 / ARM64 hardware.
- An existing HTTP MCP backend reachable from the app.
- A public hostname and HTTPS reverse proxy.
- An MCP client that supports the gateway's OAuth flow.

Gemini compatibility has not been verified for this wrapper. Test login and a real tool call before relying on it.

## Installation in Home Assistant

1. Add [the app repository](https://github.com/tschoehuijs/HomeAssistantApps) through **Settings > Apps > App store > three-dot menu > Repositories**.
2. Refresh the store or select **Check for updates**.
3. Open **MCP Auth Gateway** and select **Install**.
4. Open **Configuration** before starting the app.

Older Home Assistant versions label Apps and App store as Add-ons and Add-on store. If the repository is already added, do not add it again.

## Configuration

Example values below are placeholders. Replace them with your own addresses and password.

```yaml
external_url: "https://mcp.example.com"
backend_url: "http://192.168.1.100:9876"
password: "REPLACE_WITH_A_UNIQUE_RANDOM_PASSWORD"
```

### external_url

The public HTTPS origin used by your MCP client.

- Include `https://`.
- Do not include the MCP endpoint path, credentials, query parameters, or fragments.
- Route the entire hostname to this gateway, including OAuth discovery and login paths.

### backend_url

The internal origin of the existing MCP server.

- Include `http://` or `https://` and the backend port if required.
- Do not include the MCP endpoint path.
- Use an address reachable from inside the app. `localhost` refers to this gateway container, not the HAOS host or another app.
- Do not point this option at the gateway itself or at its public hostname; that would create a proxy loop.

The gateway's HTTP proxy mode preserves the backend request path. For example, a backend endpoint at `/servers/vinted/mcp` is accessed through the same path on the public hostname.

### password

Set a unique, randomly generated password of at least 20 characters in the app's Configuration tab. Do not commit it to GitHub or paste it into logs or support requests.

The password field masks the UI value; it does not encrypt the saved options at rest. This is the gateway login password, not a Vinted password, OAuth client secret, or Nginx HTTP Basic password.

## Start and test locally

1. Save the configuration.
2. Start the app.
3. Open **Log** and check for errors.
4. Leave public reverse-proxy routing unchanged until the following checks pass.

### Health check

The default host port is **9877**, mapped to container port **8080**. Substitute your HAOS IP below if different:

```sh
curl --silent --show-error --include --max-time 15 \
  'http://192.168.1.8:9877/healthz'
```

`/healthz` is the upstream application's health endpoint. The `z` is intentional. A successful response indicates that the gateway is responding, not that authentication or backend tools have been validated.

### Authentication check

For a backend whose MCP path is `/servers/vinted/mcp`:

```sh
curl --silent --show-error --include --max-time 15 \
  'http://192.168.1.8:9877/servers/vinted/mcp' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json, text/event-stream' \
  --data-raw '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-03-26","capabilities":{},"clientInfo":{"name":"auth-check","version":"1.0.0"}}}'
```

Without credentials, expect an authentication rejection, normally **HTTP 401**. Successful MCP initialization without authentication means protection has not been established. A 404 or 500 is not a passing security test.

## Reverse proxy and HTTPS

Only proceed after local startup and authentication checks pass.

For the existing Nginx Proxy Manager host:

| Setting | Value |
| --- | --- |
| Scheme | `http` |
| Forward hostname / IP | Your HAOS IP |
| Forward port | `9877`, unless changed in the app's Network settings |
| SSL certificate | Certificate matching the public hostname |
| Force SSL | Enabled |

Route the entire hostname to the gateway. Do not leave a custom location that routes the MCP path directly to the unauthenticated backend. Do not add HTTP Basic authentication on top of OAuth unless the client explicitly supports both.

Nginx terminates public HTTPS; the gateway's internal listener uses HTTP. The local network hop is therefore not encrypted by this configuration. Keep it on a trusted network.

After switching routing, repeat the unauthenticated initialization test using the public HTTPS origin. It must reject access rather than return successful MCP initialization.

## Connect the MCP client

Use the public origin followed by the backend's existing MCP path. For example, for the example origin above and the Vinted backend path:

```text
https://mcp.example.com/servers/vinted/mcp
```

In Gemini, remove and re-add the previous connection if necessary to trigger a fresh authorization flow. Leave advanced client credentials blank initially to attempt automatic registration. If registration fails, capture the exact error; do not put the gateway password into the Client ID or Client secret fields.

A complete test requires:

1. Successful authorization through the gateway's login flow.
2. Tool discovery.
3. A successful backend tool call.
4. Rejection of an unauthenticated public initialization request.

Do not assume client compatibility from a successful health check alone.

## Persistence and backups

The wrapper stores OAuth state and signing material under `/data/oauth`, inside the app's persistent private storage. App options are read from `/data/options.json`.

Include app data in backups and protect those backups as sensitive. Do not delete authentication state as a routine troubleshooting step; clients may need to reconnect if state is lost. Uninstalling without preserving data may require reauthorization.

## Security

- Keep the backend port private. Do not forward port 9876 from the router to the backend.
- Remove any public hostname or Nginx location that bypasses the gateway.
- Local clients may still reach an unauthenticated backend on the LAN; trust or restrict that network separately.
- The health endpoint is intentionally available without login.
- Do not share passwords, tokens, signing keys, options files, or authentication-state files.
- A password change should not be assumed to revoke already issued tokens or sessions. Verify upstream revocation behavior if immediate access removal is required.

## Troubleshooting

| Symptom | Check |
| --- | --- |
| App missing from the store | Confirm the app folder is committed to the configured repository branch, then refresh the store. |
| Build fails | Copy the final Supervisor build error. Do not repeatedly retry an unchanged build. |
| Password validation error | Set a password of at least 20 characters in Configuration. |
| Connection refused on 9877 | Check app startup logs and the published port in Network settings. |
| Health works, MCP returns 404 | Check the backend origin and the actual backend MCP path. |
| OAuth discovery or login fails | Check that the entire public hostname reaches the gateway and that external_url exactly matches its HTTPS origin. |
| Public initialization succeeds without login | Check for a route bypassing the gateway. Do not consider the deployment secured. |
| Login works but tool fails | Inspect gateway and backend logs separately; an upstream API error is not necessarily an authentication failure. |

Share only relevant error lines, with secrets removed.

## Updates and upstream documentation

This wrapper pins Sigbit MCP Auth Proxy **v2.10.2**. Its Dockerfile verifies the official ARM64 executable against a fixed SHA-256. Update the release version and checksum together.

- [Upstream repository](https://github.com/sigbit/mcp-auth-proxy)
- [Upstream documentation](https://sigbit.github.io/mcp-auth-proxy/)
- [Quick start](https://sigbit.github.io/mcp-auth-proxy/docs/quickstart/)

The icon and logo identify the Home Assistant app. They do not configure Gemini's custom-app icon.
