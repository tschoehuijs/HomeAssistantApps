# MCP Auth Gateway

Experimental HAOS wrapper for sigbit/mcp-auth-proxy v2.10.2. ARM64 only.

## Install

1. Put this entire mcp_auth_gateway folder in your existing Home Assistant app repository. Do not replace its repository.yaml.
2. Commit and refresh the app store. Install MCP Auth Gateway.
3. Set a unique random password of at least 20 characters in the app configuration, not in GitHub.
4. Keep the supplied external_url and backend_url for your current setup.
5. Start the app. Check the log.
6. Test http://192.168.1.8:9877/healthz locally.
7. Test an unauthenticated MCP initialization at http://192.168.1.8:9877/servers/vinted/mcp. Expect authentication rejection, normally 401, not successful initialization.
8. Only after these checks pass, change the existing Nginx proxy host from port 9876 to 9877. Route the entire hostname to the gateway, including OAuth discovery/login paths. Keep HTTPS enabled.
9. Re-add https://mcp.tschoehuijs.duckdns.org/servers/vinted/mcp in Gemini and test login and a real tool call. Gemini compatibility is not verified.
10. Ensure no public route or router port forwarding bypasses the gateway to port 9876.

## Persistence and security

OAuth state and signing keys are stored under /data/oauth. Include app data in backups; protect those backups. The password option is masked in the UI but is not encrypted at rest. Local port 9876 remains unauthenticated: trust/restrict your LAN and do not expose it publicly. Do not share /data/options.json or authentication state.

## Artwork

Included icon and logo were generated with Microsoft Copilot. These are HAOS app assets, not a guarantee of a Gemini custom-app icon.

## Validation

Shell syntax and YAML structure checked locally. No Docker build or Gemini end-to-end execution was performed in the authoring environment.

## Upstream

https://github.com/sigbit/mcp-auth-proxy
https://sigbit.github.io/mcp-auth-proxy/docs/configuration/

Binary pinned to v2.10.2 and verified during build against its published ARM64 SHA-256. Update the version and checksum together.
