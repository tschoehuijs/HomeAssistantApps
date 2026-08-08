# Changelog

## 2.0.1

Mostly performance and cleanup.

### Storage
- Duplicates moved into the database with better pagination. Sorts by recoverable space.
- Total storage no longer double counts servers sharing the same files.
- Growth rate uses full snapshot history instead of waiting a week after upgrade.
- Storage cards show an error when a request fails instead of a zero.

### Under the hood
- Connection pool sizes itself from postgres max_connections and splits across instances. DATABASE_POOL_MAX still overrides.
- Aggregate refreshes and the identity backfill run in batches.
- Library sync clears stale queued jobs at boot.
- Fixed a deadlock in poster color extraction.

### Small stuff
- Watched checkmarks: green when you watched it, orange when someone else did.

