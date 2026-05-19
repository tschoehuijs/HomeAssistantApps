# Changelog

## 1.4.28

Tracearr v1.4.28 - Docker Secrets, Helm Chart, Mobile Translations, and More!

`_FILE` environment variables are now supported on both supervised and standard images. Drop your secrets in `/run/secrets/` and Tracearr reads them on startup. No more plaintext passwords in compose files.

A Kubernetes Helm chart ships with the repo at `docker/helm/tracearr/`. Bundled TimescaleDB and Redis StatefulSets, optional network policies, and PVCs for backups and image cache.

The mobile app is now fully translated alongside the web. Pick a language from Settings or let it follow your device locale.

Two-letter codes (`en`, `de`, `pt`) are now full locale codes (`en-US`, `de-DE`, `pt-BR`). New variants: `pt-PT` and `zh-TW`. Existing language preferences map across automatically.

When someone disappears from a media server, they keep their history and pick up a "Removed" badge on the Users page instead of dropping off the list. Stats and violations stay intact.

Connected devices poll every 60 seconds. Mobile devices now update their last-seen on every authenticated request, not just heartbeats. (#678)

The mobile app's iOS deployment target moved from 15.1 to 16.1. iOS 15 devices won't pull updates from TestFlight or the App Store going forward.

- Wrong media version picked for multi-version transcodes (#686)
- Library sync crash on null bytes in music metadata (#709)
- Library items duplicating during bulk upsert
- Sessions compression policy interfering with imports
- Map zoom snapping back on data refresh (#664)
- Map tile rendering
- Album art aspect ratio on now playing cards
- Discord notification duration bug
- Tooltips clipped inside cards and tables (#680)
- Engagement metrics bug (#675)
- Location icons getting squashed by long text (#676)
- Compact city/region format for location strings
- HighchartsReact import broken under Vite 8

