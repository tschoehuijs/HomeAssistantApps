# Chaptarr

## Overview

Home Assistant wrapper for [Chaptarr](https://github.com/Chaptarr/chaptarr), an audiobook and eBook collection management application.

## Configuration

Review the **Configuration** and **Network** tabs before starting. Available options, mounts, and ports depend on this repository's `chaptarr/config.yaml`. This documentation intentionally does not prescribe values that have not been confirmed from that file.

## Installation and usage

1. Install **Chaptarr** from this Home Assistant repository.
2. Review its Configuration and Network settings and any configured storage mounts.
3. Start the app and inspect its logs.
4. Open its interface using **Open Web UI**, if available, or the configured host and port.
5. Follow Chaptarr's setup instructions to connect the relevant libraries and services.

## Updates

The repository maintains a Chaptarr wrapper and an upstream version update process. Install available updates from Home Assistant after reviewing the release notes.

## Troubleshooting

- **Interface unavailable:** Check the app logs, running status, and network port mapping.
- **Library or file access issues:** Review directory mappings and permissions.
- **Unexpected behavior after updating:** Review upstream release notes and the app logs.

## Credits and license

Upstream: [Chaptarr/chaptarr](https://github.com/Chaptarr/chaptarr). License: GPL-3.0; consult the license file in the app directory and the upstream repository.
