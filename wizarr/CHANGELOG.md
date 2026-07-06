# Changelog

## 2026.7.0

# 🚀 Stable Release v2026.7.0

## What's Changed

### 🐛 Bug Fixes
- handle multi-plex oauth invites
- align static asset cache-busting in Plex login template
- implement deterministic build lifecycle and dynamic cache busting
- resolve external Bowser dependency and casing fallback
- improve Service Worker update strategy and cache management
- resolve persistent Service Worker cache-first WSOD lock-in
- resolve White Screen of Death (WSOD) by serving external assets from clean vendor directories
- use uv instead of broken pipx babel in verify-translations
- merge Weblate contributions and prevent future lock conflicts
- removed to prevent confusion

### 👷 CI/CD
- announce releases on Discord (#1321)

### 💄 Styling
- use dynamic url_for query parameters and optimize context processor imports

### 🧹 Chores
- 
- 
- 

### 📝 Other Changes
- Keep invite form open on errors
- Fix invite library dropdown interactions (#1324)
- Remove Blacksmith from workflows (#1325)
- Validate invitation form submissions (#1322)
- Bundle external frontend assets (#1320)
- Fix recent onboarding and media-server bugs (#1318)
- Fix unlimited invite only recording first user in Latest Accepted Invites
- Fix multi-server Emby permissions
- Remove mention of `PORT` and `HOST` options from docs
- Add: `HOST` & `PORT` env vars for wizarr. This lets users override the address on which gunicorn binds. The change also updates the docs. fixes #1058


**Full Changelog**: https://github.com/wizarrrr/wizarr/compare/v2026.7.0...v2026.7.0

## 📋 All Commits Included (25 commits)

<details>
<summary>Click to expand commit list</summary>

```
0e63eee95 chore: release v2026.7.0
7803cfd74 Keep invite form open on errors
04e3b58a8 Fix invite library dropdown interactions (#1324)
19b948b7b Remove Blacksmith from workflows (#1325)
dda4d706e ci: announce releases on Discord (#1321)
c10a0e191 Validate invitation form submissions (#1322)
42fdbae8b Bundle external frontend assets (#1320)
a9a2bcce5 chore: update dependencies (#1319)
31005dcf8 Fix recent onboarding and media-server bugs (#1318)
d30a3bdc2 Fix unlimited invite only recording first user in Latest Accepted Invites
62d893403 Fix multi-server Emby permissions
8e680388d fix: handle multi-plex oauth invites
d91f4dc43 chore(deps): bulk-bump python and npm deps from open dependabot PRs (#1279)
365d1d57f fix(frontend): align static asset cache-busting in Plex login template
4b0eca0d3 style(flask): use dynamic url_for query parameters and optimize context processor imports
a33d79dd4 fix(assets): implement deterministic build lifecycle and dynamic cache busting
492d96c3e fix(assets): resolve external Bowser dependency and casing fallback
123a96719 fix(pwa): improve Service Worker update strategy and cache management
7a0f5fdcd fix(pwa): resolve persistent Service Worker cache-first WSOD lock-in
a378d7668 fix: resolve White Screen of Death (WSOD) by serving external assets from clean vendor directories
7fe3b3459 Remove mention of `PORT` and `HOST` options from docs
59bc22931 fix(ci): use uv instead of broken pipx babel in verify-translations
0e04feeeb fix(i18n): merge Weblate contributions and prevent future lock conflicts
9dfcf1449 fix(docs): removed to prevent confusion
c564f91fb Add: `HOST` & `PORT` env vars for wizarr. This lets users override the address on which gunicorn binds. The change also updates the docs. fixes #1058
```
</details>

