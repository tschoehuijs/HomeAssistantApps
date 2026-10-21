# Changelog

## 2.9.0

# Tracearr v2.9.0 - A shorter sidebar, tabbed Stats and Library, People, and music

### Navigation
The sidebar is down to nine entries. Stats, Library and Automations are tabbed sections. Stats and Library share one time range picker, and the range stays across tabs and sidebar links. Violations sits under Automations with a pending count on the sidebar. Old URLs redirect.

### People
Stats has a People tab that ranks everyone by plays, hours, data, transcode share, requests or last seen, with search and paging. Users is a management table with role and sign-in columns, and a Status column that links each pending count to Violations. A user page shows stats for the selected range against the prior range and the server average.

### Music
Browse has a Music tab with an artist grid, and artist pages list albums with year and track count beside a Listeners panel. Overview has shelves for new albums and most played artists. Activity charts split plays into movies, shows and music. History and the Dashboard show listen time beside watch time, and tracks say played instead of watched.

### New
- Sidebar drops to nine entries; Stats and Library share one time range, Automations is tabbed
- Violations is a tab under Automations, and the sidebar shows the pending count
- People tab in Stats ranks every person by plays, hours, data, transcodes, requests or last seen
- Genres tab shows library share beside play share, prior-range deltas, finished rate and never played
- Click a genre for a sheet with its viewers, top titles, hourly pattern and never-played titles
- Library tabs share one media type control (movies, TV shows or artists) that stays in the URL and in links
- Music libraries sync albums with their own art and added date
- Browse has a Music tab with an artist grid, and artist pages list albums, listeners and plays
- Clicking an album on an artist page opens a sheet with its tracks, plays, listeners and listen time
- Overview shelves for recently added albums and most played artists
- Activity charts split plays into movies, shows and music
- Listen time shows beside watch time on History and the Dashboard when music was played
- Storage lists every library with its item count and size
- Poster caching after library syncs can be turned off in Settings → Servers → Posters

### Improved
- Page headers are gone; the controls row (tabs, time range, filters) is the header on list pages and sections
- Users is a management table with role, sign-in and pending flags, and filters for each
- User pages show range stats, prior-range and server-average comparisons, when, what and where cards, and tabs
- The Top 3 podium is gone; the People table is the ranking
- Bandwidth shows the top five people by data; Bandwidth, Devices and Requests link to People for the full ranking
- Quality, Storage and Most Watched take custom date ranges
- History's date range is in the URL like every other page
- Stats tables, session and stream details, dialogs, badges and empty states are translated

### Fixes
- A member whose library limits change no longer sees the old cached genres for up to an hour
- Plays under 2 minutes that pass the watched threshold, like short tracks, count in stats and the v2 history API (#1329)
- Music rows in History say played instead of watched (#1000)
- Background tasks no longer pile up after restarts; one sync or poster warm-up per server, resumed where it stopped
- A Tautulli import interrupted by a restart continues from the last finished page
- A busy server no longer bounces you to the dashboard; you stay on the page, and signing in returns you to it
- PAL SD shows as 576p in Now Playing and history; Normalize Resolutions under Jobs relabels older plays (#1334)
- A custom range of one day no longer fails with an error on People and user pages

### Notes
- Storage's never-watched count matches Stale, and the Dead Weight list is in the Stale card
- Stats rebuild in the background after updating and show the last 7 days until done; music play counts will go up
- Today's plays, sessions and active users count music on the Dashboard and the v1 /stats/today
- Moved pages: /media is now /library and the /stats/users page is now /stats/people; old links redirect
- The /api/v1/stats/users and /api/v1/stats/top-users API endpoints were removed; /api/v1/stats/people replaces them
- The first scan after this update is a full scan so albums appear; items it finds are not announced as new
- First boot after updating clears queued tasks once and queues one poster pass per server; syncs restart, imports stay

