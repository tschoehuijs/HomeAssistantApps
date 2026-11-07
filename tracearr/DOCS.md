# Tracearr

## Overview

Home Assistant wrapper for [Tracearr](https://github.com/connorgallopo/Tracearr), providing real-time monitoring for Plex, Jellyfin, and Emby.

## Configuration

The wrapper publishes container port **3000** on host port **3000** by default. The app configuration maps the Home Assistant `data`, `media`, and `share` directories with read/write access. No user-defined app options are exposed in the provided `config.yaml`.

## Installation and usage

1. Install **Tracearr** from this Home Assistant repository.
2. Review its **Network** and **Configuration** tabs.
3. Start the app and inspect the logs.
4. Open the web interface using **Open Web UI** or `http://YOUR_HOME_ASSISTANT_IP:3000/` if the default host port is unchanged.
5. Complete Tracearr's initial setup and configure your media server.

## Updates

The repository's Tracearr update workflow checks upstream GitHub releases daily, updates `config.yaml` and the changelog, and creates a repository release. Install the available Home Assistant app update to deploy a new version.

## Troubleshooting

- **Web UI unavailable:** Confirm the app is running and port 3000 is not used by another service.
- **Database or Redis errors:** Inspect the app logs; this wrapper starts bundled services using supervisord.
- **Media data unavailable:** Review the app's directory mappings and access permissions.

## Credits and license

Upstream: [connorgallopo/Tracearr](https://github.com/connorgallopo/Tracearr). License: AGPL-3.0; consult the license file in the app directory and the upstream repository.
