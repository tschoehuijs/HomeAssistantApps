# Changelog

## 2.8.0

# Tracearr v2.8.0 - Members can sign in

**Every admin becomes a member on upgrade. Give Admin back on their user page or under Settings → Sign-in.**

### Member sign-in
People you share a server with can sign in to Tracearr with their Jellyfin, Emby or Plex account once you turn it on in Settings → Sign-in, server by server. On a user's page you can Allow or Block one person whatever the switch says. Members land on a personal dashboard of their own watching and requests, and never see a trust score, a violation, or anyone else's name or titles.

### Jellyfin Quick Connect
A Jellyfin member can sign in without typing a password: the login page shows a code, they enter it in Jellyfin under Quick Connect, and Tracearr signs them in once it is approved.

### Sign-in methods and View as
Settings → Sign-in shows the methods your owner account holds, each with a switch, and keeps the last one on. It also lists everyone set to Allow or Block with their role, so you can add a person, change their role or send them back to the default without opening their page. From a user's page, an owner can view Tracearr as any admin or member, read-only for up to an hour.

### New
- Members sign in with a Jellyfin or Emby password, Jellyfin Quick Connect, or their Plex account
- Member sign-in is off by default; turn it on in Settings → Sign-in, then per server
- Each person is Allow, Block or Default on their user page; Allow works even with both switches off
- /login?all also lists servers whose switch is off but where someone set to Allow has an account
- Someone the media server accepts but the owner keeps out is told to contact the server owner
- Members see their own history, stats and requests, browse libraries, and never a trust score or a violation
- Members land on a personal dashboard: last 30 days, top titles as posters, how you watch, all-time moments, requests
- Owners and admins switch the dashboard between Server and Personal, where Personal shows their own watching
- The member Library overview is what's new plus Most Popular without counts, with a Not watched by you link
- Settings → Sign-in lists everyone set to Allow or Block with their role, and adds or clears people from there
- OIDC sign-in links to an allowed member by email or username
- Owners can view Tracearr as any admin or member from the user page, read-only for up to an hour
- Show members anonymous server activity gives members counts of other streams and plays, never names or titles
- The user page shows how many times each person signed in and when they last did

### Improved
- Settings → Sign-in lists only the sign-in methods your owner account holds, and keeps the last one on
- The login page only shows the sign-in methods that are switched on, including Plex
- A poster cache directory the server cannot write to is logged with the error code and uid
- Stream and trust score pushes start on for new phones and any phone that never opened its notification settings

### Fixes
- Signing in with OIDC on a new install now creates the owner instead of failing on a missing username
- Open on server and notification links use the server's public address when one is set
- The supervised image fixes ownership of a separately mounted image cache and /data/backup
- The poster cache warning in Settings → General clears as soon as the cache is on a mounted volume
- A concurrent streams rule kills the stream again instead of skipping it as condition cleared (#1308)
- Newsletters keep sending after Redis drops and reconnects instead of stopping until a restart

### Security
- A page on another port or subdomain of the same host can no longer act with your session
- A Plex sign-in can only be finished in the browser that started it
- Crafted image paths can no longer reach other Plex, Jellyfin or Emby endpoints through the image proxy

### Notes
- Every admin becomes a member on upgrade; give Admin back on their user page or under Settings → Sign-in
- TRUST_PROXY=true now trusts one proxy hop and is needed for x-forwarded-host; two chained proxies need TRUST_PROXY=2
- TRUST_PROXY must be true, false, a hop count or proxy IPs/CIDRs; any other value stops startup
- CORS_ORIGIN=* now allows only requests without a session; list any other origin that needs one

