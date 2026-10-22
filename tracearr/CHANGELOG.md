# Changelog

## 3.0.0

# Tracearr v3.0.0 - Download tracking, Telegram and a new map

### Downloads
Tracearr now records who downloads what from Plex, Jellyfin and Emby: the file, the device, and for app downloads the quality that was actually delivered. There is a Downloads tab under Stats, a tab on each user and a panel on each media page. A Download burst automation alerts when one person pulls more than a set number of items or gigabytes in a window. [Docs](https://docs.tracearr.com/configuration/downloads)

### Telegram
Telegram joins the notification destinations. Give it a bot token and a chat ID; messages come through as plain text with the title in bold, media alerts carry the poster, and links to the media page show as buttons. ntfy, Gotify and Pushover notifications now link to the media page too. [Docs](https://docs.tracearr.com/configuration/destinations)

### Map
The map now shows every location with a list beside it ranked by streams, which follows the part of the map in view. Selecting a place shows its people, devices, first and last seen, and latest streams; overlapping places merge into an area with the same detail. Each location links to History filtered to its city and region.

### New
- Telegram is a notification destination, set up with a bot token and a chat ID
- Telegram notifications for added and upgraded media carry the poster
- Media notifications on ntfy, Gotify, Pushover and Telegram open the media page
- Downloads from Plex, Jellyfin and Emby show under Stats, on each user and on the media page
- An automation can fire when a person downloads more than N items or gigabytes in a window
- Converted downloads record the quality the app received, not the file on the server
- The map has a list of locations ranked by streams that follows the part of the map in view
- Selecting a location shows its people, devices, first and last seen, and latest streams (#439)
- Overlapping locations merge into an area that lists its places and people
- A location links to History filtered to its city and region (#1353)

### Improved
- Gotify and ntfy priority and the Apprise type follow the event severity unless an automation sets one
- Server back online no longer bypasses Pushover quiet hours
- Session writes and maintenance walks no longer scan compressed history, which was slow on small hosts
- Maintenance walks pause between batches so polling and the UI stay responsive on a single core

### Fixes
- The map shows every location instead of the 500 busiest, and its totals count all of them
- A custom date range on Stats, Map, History and user pages includes the whole last day in your time zone
- A session left open through downtime is closed at the time it was last seen, however old it is
- Merging accounts refreshes the daily aggregates so the merged person's older history stays in stats

### Notes
- Without the 0.6.0 SSE plugin, downloads are picked up every 30 seconds instead of immediately
- Plex downloads come from its websocket, so one made while Tracearr is disconnected from Plex is not recorded

