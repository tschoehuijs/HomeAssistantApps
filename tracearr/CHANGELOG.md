# Changelog

## 1.4.31

Realtime reliability pass for Jellyfin and Emby SSE, and Tracearr now shows the installed plugin version with an update nudge when a new release is out (badge in Settings > Servers plus a sidebar arrow). Plugin 0.2.0 reports its version; older installs just show as needing the update.

Also fixed servers added at runtime not connecting realtime until a restart, made a single bad poll unable to wipe active sessions, and cut SSE reconnect flapping with a wider heartbeat window.

