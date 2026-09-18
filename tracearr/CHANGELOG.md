# Changelog

## 2.4.0

# Tracearr v2.4.0 - Housekeeping and mobile

### Imported history
Link Imported Plex History links Tautulli plays that never matched a library item, so their plays and watched state count. Remove Imported Duplicates deletes an imported play only when a tracked play already records the same thing. Both are under Settings → Data → Jobs. Jellystat's JSONL backups import, and every importer skips plays that started after the server was added to Tracearr. [Docs](https://docs.tracearr.com/getting-started/import)

### Resolution
Resolution comes from pixel dimensions on every server, and 8K, 1440p and 480p have their own buckets in library quality charts, catalog filters and automation conditions. Library counts shift after upgrading: 1440p and 8K titles leave 4K, and 480p titles leave SD. Plex libraries rescan in full once to pick this up.

### Mobile
The iOS home screen widget refreshes when a stream starts or stops, at most every 20 minutes. Pairing shows Tracearr as the instance name instead of the first media server's name. [Docs](https://docs.tracearr.com/configuration/mobile)

### New
- Link Imported Plex History links unmatched Tautulli imports so their plays and watched state count
- Run Remove Imported Duplicates in Settings → Data → Jobs if an import doubled plays

### Improved
- Resolution comes from pixel dimensions, and 8K, 1440p and 480p have their own buckets
- Jellystat imports link episode plays to the episode; plays Jellystat may have moved to a different title stay unlinked
- Jellystat imports take the runtime from the media server, so plays past the watched threshold count as watched
- Jellystat imports no longer store a playback position Jellystat never measured
- Jellystat import says when plugin plays need the Playback Reporting Plugin Data table to link
- The iOS home screen widget is refreshed when a stream starts or stops, at most every 20 minutes

### Fixes
- Tautulli, Jellystat and Playback Reporting imports skip plays that started at or after the server was added
- Jellystat and Playback Reporting imports skip plays whose recorded play time runs past the media runtime
- Jellystat's newer JSONL backups can be imported ([docs](https://docs.tracearr.com/getting-started/import))
- Large Jellystat backups use far less memory to import and no longer sit in Redis while they wait
- The Map page zooms to where plays are instead of stretching to one far-off play, and fills the window on desktop
- Plays that were linked to a whole show, season, artist or album instead of the item played are unlinked
- Acknowledging violations in bulk leaves ones already acknowledged alone and counts only the rest
- Pairing the mobile app shows Tracearr as the instance name instead of the first media server's name
- Templates that use a newsletter or first-seen trigger, or 1440p/8K values, state the server version they need

### Notes
- After upgrading, stats rebuild in the background and show only the last 7 days until that finishes
- The first library sync after upgrading rescans every Plex library in full once
- Library resolution counts shift after upgrading; quality history keeps the old buckets for earlier days
- Automation conditions with resolution equals 4K no longer match 8K or 1440p; at least conditions are unaffected

