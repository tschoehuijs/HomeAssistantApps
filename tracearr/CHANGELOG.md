# Changelog

## 2.5.1

# Tracearr v2.5.1

### Improved
- The stream map shows towns, parks, rivers and detailed coastlines up to zoom 10

### Fixes
- A failed Postgres connection logs the pg error code and message instead of only db:false
- A title watched after a short first sitting counts as a play and lists its watcher on the media page (#1232)
- Clicking a stream map location shared by more than one server no longer blanks the page

### Notes
- Plays on media, genre and catalog pages rebuild in the background after updating and show 7 days until done
- The image is about 500 MB larger, all of it the bundled stream map

Other release notes: https://github.com/connorgallopo/Tracearr/releases/tag/v2.5.0

