# Changelog

## 2.0.0

# Tracearr v2.0.0 - Media Library, One Identity Per Title, Public API v2

**BACK UP BEFORE UPGRADING.** This release migrates the database heavily. If you need the escape hatch, a 1.5 backup restores cleanly on 2.0.

### New Media section

Browse your whole library as a poster wall with an A-Z rail and filters for library, resolution, HDR, size on disk, and watched - two-tone checkmark for "you watched" vs "someone watched". Detail pages list every copy of a title with per-file quality, library, and size. Genre breakdown, storage, and watch pages round it out.

### One identity per title

The same movie on two servers is one row everywhere now - stats, leaderboards, history. Seasons and music get real identities too, and wrongly split titles heal themselves.

### Every file counted

Tracearr used to read a title's first file and drop the rest. Now every version is tracked: 4K + 1080p copies, duplicate libraries, mirrored files counted once. Storage totals are honest, duplicates catches same-server copies, sessions record which version actually played, and 1440p/8K no longer count as SD.

### Public API v2

Bearer tokens, rate limits, OpenAPI docs served in-app. Built so apps that use Tautulli can use Tracearr instead.

### Mobile: every tab, every server

Rolling out with the 2.0 app update. Server selection is global now - pick All, one server, or any subset from any tab, and it sticks across restarts. It used to be a dashboard-only trick that quietly collapsed to one server everywhere else. Navigation got rebuilt on native tabs: the tab bar survives detail pushes, and the drawer is gone in favor of a server sheet and header buttons. Also in this round: iOS 26 header buttons stop flashing white on tab switches, the stream map matches the dark theme on both platforms, servers behind Tailscale are reachable on iOS again (App Transport Security was silently blocking them), and the UI primitives now speak to screen readers.

### Under the hood

- Plex library changes sync in seconds via server events (Jellyfin/Emby get this with the next SSE plugin release)
- Upgrades show migration progress instead of looking dead, and a bad migration can't boot-loop the server
- First sync is much faster
- Fixed a silent gap in sharing detection on polled servers
- Stale content and ROI stop double counting merged titles; duplicates stop counting mirrored files twice
- OpenAPI specs publish as release assets, so the docs site always renders the spec for your version

### Notes

- Counts may shift after upgrade as versions and identities settle - that's the double counting going away
- Overall trust scores move too: you now see a person's worst account, and violation totals actually count - both sat frozen before

