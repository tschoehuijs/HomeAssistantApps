# Changelog

## 2.1.0

# Tracearr v2.1.0 - Live Stats for Every Server, Playback Reporting Imports

**UPDATE THE SSE PLUGIN** - the CPU and RAM charts for Jellyfin and Emby need Media-Server-SSE 0.4.0 or newer.

### Live server stats

CPU and RAM charts work for Jellyfin and Emby now. Pick multiple servers and they overlay on one chart, one line per server in its color, and the three stats cards share one time grid so they line up side by side.

The charts also got honest about time. They hold a real two-minute window instead of a fixed point count, so a server that samples at its own rate no longer stretches or shrinks the span. A media server with a drifting clock gets re-stamped on arrival (a server whose clock already agrees keeps its own timestamps), and a break in reporting draws as a gap, not a straight line that looks like the server held steady. When a server has nothing to report, the charts stop polling hard.

### Playback Reporting imports

Jellyfin and Emby watch history imports straight from the Playback Reporting plugin, over the server connection you already configured. No file export, no Jellystat install. A Check Plugin button tells you whether the plugin is there and how many records it holds before you commit, and you pick the media server's timezone since the plugin stores timestamps in server-local time.

Safe to run twice: rows already imported, rows from an earlier Jellystat import, and history Tracearr already tracked all get skipped. A full-range checkbox overrides the overlap guard if your history has gaps. Emby imports include IP locations and pause time; the Jellyfin plugin doesn't record those.

### Fixes

- Clicking a user from a media item's watchers or history opens that user. The link was built from the identity id where the page expects the per-server account id, so it landed on nothing
- Open on server opens the item instead of the server root. Plex goes through app.plex.tv so the link works away from home; Jellyfin and Emby use the server URL you configured
- Plex metadata refreshes no longer trigger library syncs - nightly maintenance could keep Tracearr syncing every 30 seconds for hours
- Dominant color lookups were scanning the whole library table once per poster, which made cache warming crawl. They're indexed now
- The image proxy looked up the server row on every cache miss. It remembers it for 30 seconds

### Performance

- Posters are resized by your media server instead of downloaded full size and shrunk locally - a typical fetch went from a few hundred KB to a few dozen
- Image processing is capped to one thread, so cache warming after a big sync doesn't take over a small box
- Dropped five sessions indexes no query used. Every session write maintains fewer indexes, and the disk comes back at boot
- The periodic full library scan runs on a clock, at most once every 3.5 days per library, instead of counting syncs
- Event bursts settle down: snapshot rebuilds cap at one per 5 minutes, duplicate reconciliation waits 10 minutes, count drift checks 15
- Library snapshots skip the write when nothing changed

### Security

- Cleared four dependency advisories. Two remain in build tooling that never ships with Tracearr and have no upstream fix yet

### Under the hood

- Statistics and bandwidth merged into one request behind a short cache, and the dashboard rides the socket instead of polling while connected - extra dashboards and tabs no longer multiply Plex API calls
- Transcode progress and hardware acceleration details come through for all three server types
- Public API v2 history rows carry server_user_id next to the identity id
- Poster cache warming shows in the running tasks menu with a count and progress bar
- CI exercises the oldest and newest supported TimescaleDB; extension updates are opt in at boot with TIMESCALEDB_AUTO_UPDATE
- The admin recovery CLI finds owners with legacy mixed-case usernames
- @tracearr/shared and @tracearr/translations publish to npm with each release

Thanks for running the betas - the missing poster index in beta.5 was found in a user's logs.

