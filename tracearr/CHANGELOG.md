# Changelog

## 2.5.0

# Tracearr v2.5.0 - Local plays on the map, duplicates, upgrades, and stream-aware automations

### Local plays on the map
Give a server a location in Edit Server: drop a pin or type coordinates and pick the country; city and region are optional. Local network plays on that server land on the stream map there with a Local badge, and a background job fills in past sessions. Add a dated move if the server changed homes. Rules still treat these plays as local, and removing the location puts them back to Local Network. [Docs](https://docs.tracearr.com/configuration/servers#server-location)

### Upgrades are not new
A Radarr or Sonarr upgrade deletes the old file and imports the new one, so the server hands Tracearr a fresh item and the title reappeared as newly added. Newsletters and the Recently Added shelves now leave those out, and a Recently Updated shelf on Media → Overview lists them instead. Titles reacquired more than a week after the old copy left still count as new.

### Duplicates
The Storage duplicates tab shows every file's path with a copy button, flags a Plex file the server still lists but cannot find on disk, and names the series behind an episode or the artist behind a track. Each group is marked Movie, TV or Music.

### Automations know the stream
Four new conditions: source dynamic range, source video codec, season number and episode number. Tell a stream in Dolby Vision from one in SDR, flag an AV1 stream to a remote viewer, or fire on the first episode of a season. Notification text can print all four.

### New
- An upgraded title moves from Recently Added to a Recently Updated shelf on Media → Overview and skips newsletters
- Automations can match a stream by HDR format, video codec, season or episode number
- An automation's notification text can print the stream's HDR format, video codec, season and episode number
- The Storage duplicates tab shows each file's path and flags Plex files that are gone from disk
- The browser tab title shows how many streams are playing, on every page
- Settings → Notifications → Email takes a system title for the header beside the logo
- Edit Server takes a location, with dated moves, that puts that server's local network plays on the map
- History has a Network filter that lists only local or only remote plays

### Improved
- The Storage duplicates tab names the series or artist and marks each group Movie, TV or Music
- The supervised image keeps the poster cache across container recreates instead of re-downloading every poster ([docs](https://docs.tracearr.com/configuration/environment#poster-cache))
- Poster cache warming eases off while people are streaming and backs off when a server stops answering

### Fixes
- A media page opened from a link or a refresh shows its poster
- A Tautulli import with detailed stream data shows its older plays in stats without a Full aggregate rebuild
- A Jellystat re-import with the Episodes table relinks episode plays an earlier import stored against the show
- Newsletters no longer drop new movies when more than 5,000 episodes or tracks arrive in one window
- The iOS widget asks for no more wake pushes than Apple delivers, so it wakes at most every 20 minutes
- The poster cache pass finishes on large libraries instead of stopping a few percent in
- Recently added show cards date themselves by the newest episode, not by when the series arrived
- The poster cache size estimate counts one poster per image, not one per library row
- Mobile push registration accepts every token format Expo delivers to
- People, rules and every other name list sort with capitals and lowercase together
- History sorts by title or duration on every page, with episodes under their show
- The Storage and Watch tables keep their sort across pages, and titles skip a leading The
- The Watch page ranks binge shows by their score
- Duplicates no longer pair two different episodes that Plex tagged with the same id (#1223)
- A paused Seerr link keeps the Requests page and its history instead of reading as unlinked
- Sync now refreshes the Requests page numbers right away instead of after a five-minute cache
- A user's Requests card keeps requests Seerr deleted, and Never watched skips titles they started
- The Requests page goes back to page 1 when the server picker changes

### Notes
- Standard image installs should mount a volume at /data/tracearr/image-cache to keep the poster cache ([GitHub](https://github.com/connorgallopo/Tracearr/blob/076d7ce30eac5bab25656a1ad5d8c0444b989253/docker/examples/docker-compose.pg18.yml#L51))

