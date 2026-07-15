# Changelog

## 1.5.0

# Tracearr v1.5.0 - New Auth, True Merged Users Across Servers

**MAKE SURE YOU HAVE A BACKUP BEFORE UPGRADING.** It migrates auth and user
data, and downgrading to 1.4.x afterward is not supported.

### Auth

Login got rebuilt. Local username/password, Plex, and optional SSO (set
OIDC_ISSUER_URL, OIDC_CLIENT_ID, and OIDC_CLIENT_SECRET and a provider button
appears). Web users log in once after upgrading - old web sessions don't carry
over. Mobile devices stay paired; devices paired after the upgrade use a
90-day rolling session and re-pair after 90 idle days. Jellyfin credential
login is gone; if that was your only way in, the docs site has password reset
instructions.

Behind a reverse proxy that rewrites the Host header? Forward X-Forwarded-Host
(or set CORS_ORIGIN to your public URL) or cookie login won't stick.

### Merge Users Across Servers

Merge the same person's accounts across servers into one identity. Suggestions
surface likely matches, and merges are reversible with split - even chained
ones. Once merged, the whole app treats them as one person: one row on the
Users page, leaderboards and unique viewers count people instead of accounts,
profiles combine activity across servers, and rules can target a person on all
their servers (per-rule toggle, off by default). Some counts will drop
slightly - merged people are no longer double counted.

### Bugfixes, Performance Increases, and Dependency Bumps

- sessions no longer duplicate when SSE and reconciliation race
- fixed poller overload under heavy concurrent streams
- history page is a lot faster, pagination edge cases gone
- fixed user sorting
- login reconnects after a database restore
- resolution labels trust the server and share one ladder, jobs page can
  relabel old history
- specials keep their season zero
- mobile: recovers stuck requests after backgrounding, android banners sit
  below the header, users tab stops printing the count twice
- helm chart installs work again (a bad image pin broke fresh installs) and
  the chart now tracks the release version
- ~100 dependency updates under the hood; app image runs node 24 now, redis
  image moved to v8
- JF/Emby SSE improvements **MAKE SURE TO UPDATE PLUGIN**

