# Changelog

## 3.1.2

# Tracearr v3.1.2

### New
- The owner can link their own Jellyfin or Emby account from Settings → Servers → Connections

### Improved
- The date format picker in Settings → General lists the formats themselves instead of countries
- On Unraid, Tracearr warns the owner when its database is on a user share and shows the path to switch to
- History opens faster, and its filter dropdowns stop re-querying on every visit
- Violations and a user's violation list open in a fraction of the time
- User detail, season and artist pages and Settings open faster

### Fixes
- A player left sitting at the end of an episode no longer records a watched play each time it reconnects
- Plexamp playback no longer records every queued track as a download or trips the Download burst policy (#1367)
- Agregarr coming-soon placeholders are no longer stored, so newsletters and library counts skip them
- Quality changes no longer use up a sync's 20 media-added alerts when nothing listens for media upgrades
- One library failing to sync, such as a Movies scan timing out on a slow Plex, no longer stops the other libraries
- A Plex item whose full metadata takes too long to load no longer fails its library's sync; it keeps its stored genres
- Music duplicates group by MusicBrainz id and no longer pair same-titled tracks from different artists or albums
- Duplicate fuzzy matches below 90% show as Likely or Possible instead of Exact
- Stale Content shows the library name and counts plays on merged, re-added and moved titles
- Show stats completion rates and binge scores for a date range or a member no longer read low
- Newsletter Most Watched no longer counts starts under two minutes as plays
- Library status counts respect a member's library access
- Media Overview shelves show a show's total size and best resolution
- Copy buttons work when Tracearr is opened over plain HTTP
- The v2 public API's users endpoints return the display name set in Tracearr as identity_name (#1370)

### Notes
- Updating removes the Plex track downloads already recorded, including music downloaded on purpose

Other release notes: https://github.com/connorgallopo/Tracearr/releases/tag/v3.1.0

