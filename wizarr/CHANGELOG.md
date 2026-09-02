# Changelog

## 2026.9.0

# 🚀 Stable Release v2026.9.0

## What's Changed

### 🚀 Features
- add activity tracking toggle
- confirm invitation deletion with a modal

### 🐛 Bug Fixes
- make Overseerr/Jellyseerr info-only connection creatable
- don't log AUTH FAIL for HEAD requests to /login
- include legacy single-server invites in table filter
- delete invites via explicit delete_id with defensive parsing
- don't disable libraries on a partial or empty scan
- close the Plex OAuth popup so the token isn't lost and the user reaches the wizard
- allow deleting invitations whose code contains whitespace
- invite table server filter never actually filters
- don't delete every local user when Plex returns an empty user list
- stop library scans resetting the invite library defaults

### 🧹 Chores
- 

### 📝 Other Changes
- Route the startup library scan through the shared upsert
- validate resolved libraries, not raw submitted ids
- stop guessing scan authoritativeness from row counts
- Merge commit from fork
- reject invites whose library picker was opened and then cleared
- extract the shared library-scan upsert into one helper
- apply the empty-remote user-sync guard to every backend


**Full Changelog**: https://github.com/wizarrrr/wizarr/compare/v2026.9.0...v2026.9.0

## 📋 All Commits Included (20 commits)

<details>
<summary>Click to expand commit list</summary>

```
f74a56b47 chore: release v2026.9.0
db4a3aceb feat: add activity tracking toggle
406e4e1e8 feat(admin): confirm invitation deletion with a modal
61d03f703 fix(connections): make Overseerr/Jellyseerr info-only connection creatable
a88855392 fix: don't log AUTH FAIL for HEAD requests to /login
40a6b7e37 Route the startup library scan through the shared upsert
73327ca56 validate resolved libraries, not raw submitted ids
bb02613f5 stop guessing scan authoritativeness from row counts
ea3aaa3bd fix(admin): include legacy single-server invites in table filter
5f5b5e196 fix(admin): delete invites via explicit delete_id with defensive parsing
fdda0263b Merge commit from fork
869df770b fix: don't disable libraries on a partial or empty scan
71de6c39b fix: close the Plex OAuth popup so the token isn't lost and the user reaches the wizard
63872b5a1 reject invites whose library picker was opened and then cleared
cdd83198d extract the shared library-scan upsert into one helper
3497467b2 fix: allow deleting invitations whose code contains whitespace
dc92e5f3d apply the empty-remote user-sync guard to every backend
1e79d2a76 fix: invite table server filter never actually filters
713a8a9d5 fix: don't delete every local user when Plex returns an empty user list
e040ac7d3 fix: stop library scans resetting the invite library defaults
```
</details>

