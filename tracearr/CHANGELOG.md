# Changelog

## 3.1.3

# Tracearr v3.1.3

### Improved
- Plex setup now accepts your server's own plex.direct address and only refuses Plex relay addresses
- Mobile pushes replace instead of stacking: a stream's stop replaces its start, a server back up replaces its outage
- Improved Jellyfin and Emby stream reporting

### Fixes
- Newsletter posters and logo now load in the browser view and preview when Tracearr runs under BASE_PATH (#1391)
- The 24-hour clock now shows a leading zero on hours before 10, such as 08:05 (#1392)
- An iPhone that was offline now gets the alert it missed instead of a stale stream notification
- Android phones in standby now get push notifications right away instead of when the screen next wakes

Other release notes: https://github.com/connorgallopo/Tracearr/releases/tag/v3.1.0

