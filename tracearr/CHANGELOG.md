# Changelog

## 2.6.0

# Tracearr v2.6.0 - Your own notification text and priority, plus historical servers

### Write your own notifications
A send action can set its own title and body, using the trigger's variables, a fallback for empty values, and lines that only show when a value is there. The builder previews the message for each destination you picked, cut to that destination's limits. Sends to Pushover, Gotify and ntfy can also pick a priority, from silent to urgent. [Docs](https://docs.tracearr.com/configuration/automations)

### Keep a retired server's history
Mark a server historical when you move off it or are only testing it for a while. Tracearr stops polling it, syncing it and checking it for updates, and the unreachable banner goes away. Its sessions, users and libraries stay on every page, listed after your live servers, and Resume brings it back. [Docs](https://docs.tracearr.com/configuration/servers)

### New
- A send action can set its own title and body with variables, defaults and if blocks, with a preview per destination
- A send action can set a priority for Pushover, Gotify and ntfy, replacing each one's built-in level
- A server can be marked historical: Tracearr stops contacting it and keeps its history, users and libraries ([docs](https://docs.tracearr.com/configuration/servers))
- The now playing bar shows how far ahead the transcoder is and says Buffering when a Plex client stalls
- History hides trailers unless you pick the Trailers type
- Stream details and library copies show Dolby Atmos, with a library filter
- Library copies show the Plex edition, like Extended Cut or Theatrical Cut
- Sessions that transcode only the audio show as Audio Transcode in badges, charts and filters, apart from Transcode
- Subtitle burn-in shows on stream badges, filters history and works as an automation condition

### Improved
- Docker images are about 690 MB smaller, and updates download only the layers that changed, not the whole image
- The Emby realtime setup dialog installs Tracearr SSE from Emby's plugin catalog instead of a release zip

### Fixes
- Plex DTS and DTS-HD MA group with other servers' DTS in the codec breakdown instead of showing as DCA
- The server banner says when a server rejected Tracearr's token instead of calling it unreachable
- Server Resources on the dashboard no longer fails to load for Plex servers with a long bandwidth history (#1255)
- Avatars and images from phone photos no longer show sideways or upside down (#1258)
- Merging users keeps the name of the one you kept, and only accounts a merge brought in offer Split (#1263)
- The remove-server warning now says the server's history is deleted; it used to say history was kept
- A newly added server gets its 12-hourly library sync right away instead of after the next restart
- The history Quality filter matches the badges; it used to check only the video stream
- The Tautulli import's stream details keep audio-only transcodes apart instead of counting them as video transcodes
- The Tautulli import includes plays from archived users and libraries
- Imported-history linking no longer stalls on Tautulli 2.18.0 to 2.18.2 when history rows lack metadata
- The Tautulli import reports ungrouped plays and rows without metadata as skipped, not as active sessions or errors
- A Tautulli re-import after Regroup history removes the merged plays instead of counting their watch time twice
- A Plex client buffering while paused no longer fires resume automations or cuts pause rules short
- Plex theme music and extras other than trailers are no longer recorded as plays
- Trailers and prerolls no longer count toward concurrent-stream rules
- Trailers and prerolls no longer set off stream automations, so a preroll sends no stream started notification of its own
- A slow plex.tv or media server no longer stalls library syncs, adding a server or Plex sign-in for minutes
- Count text in languages like Polish, Russian and Arabic no longer switches to English for some numbers

### Security
- The image proxy only fetches poster and avatar paths, not any request on the media server with its token

### Notes
- The first library sync after updating is a full scan on every server

