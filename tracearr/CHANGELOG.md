# Changelog

## 3.1.4

# Tracearr v3.1.4

### New
- Automations can fire when a stream passes the watched threshold set in Settings
- Browse filters by added date; clicking Movies or Episodes on the library growth chart opens it for the picked range

### Improved
- Each episode in a show's season strip names itself on hover and opens its own page
- The dashboard shows today's watch time in hours and minutes
- Hovering the time left on a Now Playing card shows when the stream ends
- Binge highlights rank shows by episodes watched back to back per person; Top shows lists episodes per viewer
- The mobile app's notification switches set what the server sends to Mobile push, so they apply to every paired device

### Fixes
- A few seconds of a title no longer counts as a viewer, and a play the server marked watched always does
- The Overview shelves now cover exactly the days picked; a 30-day range no longer includes a 31st day
- A user that fails to save during a server sync shows up in the sync's errors instead of failing the sync
- The import file drop zone opens the file picker from the keyboard

### Notes
- Tracearr now runs on Node.js 26; servers behind an HTTPS reverse proxy are reached over HTTP/2 when the proxy offers it

Other release notes: https://github.com/connorgallopo/Tracearr/releases/tag/v3.1.0

