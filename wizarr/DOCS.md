# Wizarr

## Overview

Home Assistant wrapper for [Wizarr](https://github.com/wizarrrrr/wizarr), a media server invitation and user onboarding application.

## Configuration

Review the app's **Configuration** and **Network** tabs before starting it. The available options and default ports are defined by this repository's `wizarr/config.yaml`; the running Home Assistant app is the authoritative place to inspect or change those settings.

## Installation and usage

1. Install **Wizarr** from this Home Assistant repository.
2. Review its Configuration and Network settings.
3. Start the app and inspect the logs.
4. Open the web interface using the **Open Web UI** button, if shown, or the host and port configured in Network.
5. Follow Wizarr's setup instructions to configure your media server and invitations.

## Updates

The repository's Wizarr update workflow checks upstream releases and updates the wrapper's version and changelog. Install any available Home Assistant app update to deploy a new version.

## Troubleshooting

- **Interface unavailable:** Check that the app is running and its configured host port is free.
- **Setup or media server connection fails:** Check Wizarr's app logs and the upstream documentation.
- **Update unavailable:** Reload the Home Assistant app store and inspect the repository's GitHub Actions runs.

## Credits and license

Upstream: [wizarrrrr/wizarr](https://github.com/wizarrrrr/wizarr). License: MIT; consult the license file in the app directory and the upstream repository.
