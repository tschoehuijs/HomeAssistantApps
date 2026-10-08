# Changelog

## 2.7.0

# Tracearr v2.7.0 - Live events and violations in the public API v2

### Live events in the public API
Apps can hold one connection to /api/v2/public/events and get stream, violation and server health events as they happen, with no polling. v2 also gains violations and server status, so an integration needs nothing from v1. The API docs, linked from Settings > Data & API > API, list every event type with examples. [Docs](https://docs.tracearr.com/api)

### Titles link to their media pages
Click a title in history, the session details, now playing or a stream on the map to open that movie or show's media page.

### New
- The public API v2 adds live events over SSE, plus violations and server status, so apps need nothing from v1 ([docs](https://docs.tracearr.com/api))

### Improved
- Session titles in history, now playing and the map link to their media pages
- Automation run details and the builder's live check show names instead of ids

### Fixes
- Server down and up automations fire once per outage; with session sync on, a dropped live connection alone sends no down
- Editing a Jellyfin or Emby server accepts a new API key after the old one was revoked

### Notes
- A regenerated public API v2 SDK groups its methods by resource; requests and responses are unchanged

