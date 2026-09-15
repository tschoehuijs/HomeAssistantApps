# Changelog

## 2.3.0

# Tracearr v2.3.0 - Seerr requests, newsletters, and email

### Requests
Link Seerr, Overseerr or Jellyseerr to a server and every title shows who requested it, when it landed, and whether the requester watched it. Media → Requests counts what landed, what got watched and what nobody has played, with its size on disk. Tracearr only reads from Seerr, every 15 minutes with a full pass nightly. [Docs](https://docs.tracearr.com/configuration/requests)

### Newsletters
A newsletter mails a server's members what was added over a window, on a schedule, with an optional most watched section. Each one carries an unsubscribe link and a view in browser link, and History lists every send per recipient with retry for the ones that failed. Links to Jellyfin and Emby items need the server's Public address. [Docs](https://docs.tracearr.com/configuration/email/newsletters)

### Email
One SMTP destination sends automation alerts and newsletters, with presets for seven providers. Logo, accent color, footer and postal address, plus the suppression list, are under Settings → Notifications → Email. [Docs](https://docs.tracearr.com/configuration/email)

### New
- Seerr, Overseerr or Jellyseerr request history on media and user detail, read-only ([docs](https://docs.tracearr.com/configuration/requests))
- A Requests page under Media tracks what landed and who watched what they asked for ([docs](https://docs.tracearr.com/configuration/requests#the-requests-page))
- Newsletters mail members what was added and what got watched most ([docs](https://docs.tracearr.com/configuration/email/newsletters))
- A newsletter across several servers only lists the ones each member has an account on ([docs](https://docs.tracearr.com/configuration/email/recipients#one-email-per-set-of-servers))
- Newsletters take a sender name, a rich-text intro and outro, and an opt-in Tracearr footer link
- A digest trims itself under Gmail's 102 KB clip, and each trimmed section says how many it left out
- Newsletter posters can be attached, hosted from your external URL, or left out ([docs](https://docs.tracearr.com/configuration/email/newsletters#poster-images))
- A contact email on the user page, edited next to the name, is where that person's newsletters go ([docs](https://docs.tracearr.com/configuration/email/recipients#setting-a-contact-email))
- SMTP email destination with presets for Postmark, Resend, SES, Mailgun, SendGrid, Brevo and Gmail ([docs](https://docs.tracearr.com/configuration/email))
- A what's new dialog opens once after an update, and clicking the sidebar version reopens it
- The update dialog lists anything to do before updating, like backing up or updating the SSE plugin
- Manage recipients sheet to exclude members from a newsletter or add addresses ([docs](https://docs.tracearr.com/configuration/email/recipients#exclude-and-include))
- Unsubscribe and view-in-browser links in every newsletter, and a History tab with retry ([docs](https://docs.tracearr.com/configuration/email/recipients#unsubscribing))
- Email branding and a suppression list under Settings → Notifications → Email ([docs](https://docs.tracearr.com/configuration/email#branding))
- Verify certificate switch for self-signed mail servers like Protonmail Bridge
- Jellyfin and Emby API keys can be changed in Edit Server ([docs](https://docs.tracearr.com/configuration/servers#changing-the-url-or-api-key))
- New trigger "a stream is first seen" fires before the thirty-second confirmation ([docs](https://docs.tracearr.com/configuration/automations#sessions))
- Triggers for when a newsletter is sent or a send fails, plus a Newsletter failed template ([docs](https://docs.tracearr.com/configuration/automations#newsletters))
- Public address on Jellyfin and Emby servers so newsletter links open for members ([docs](https://docs.tracearr.com/getting-started/first-server#public-address))

### Improved
- Settings is five groups in a left column, and old paths redirect
- Merge suggestions say why two users matched and can be dismissed
- A merge carries over contact email, newsletter exclusions and Seerr requests
- Jellyfin and Emby usernames that are email addresses count as the account email

### Fixes
- Jellyfin 12 movies in a collection no longer drop out of the library
- A failed Plex shared-users fetch no longer marks every user as removed
- A scan checks each missing item by id with the server before removing it
- Plex titles keep all their genres after the next full sync
- Jellyfin 12 music artists no longer land under video libraries and stall snapshots
- Most popular ranks read 1 to 20 again
- Dead Weight no longer skips titles someone opened but never watched
- A rejected Jellyfin or Emby API key shows an error instead of the login page
- Series browse quality, HDR and size filters read the episodes
- The update check reads Jellyfin's two-part v12.0 version
- The server version line no longer offers an older release as an update
- Share codes work on beta builds
- Emby admin check tells a down server, a bad key and a non-admin account apart
- Tautulli import skips a page that won't fetch instead of failing the run
- Library sync survives a bad library name
- The Browse grid fills the window and refits when a banner comes or goes

### Security
- Connecting a Jellyfin or Emby server no longer hands a login token to the browser

### Notes
- The first library sync after updating is a full scan on every server
- An auth proxy must let `/api/v1/email/unsubscribe/*`, `/api/v1/newsletters/view/*` and `/api/v1/images/proxy` through ([docs](https://docs.tracearr.com/configuration/email/recipients#behind-a-reverse-proxy))
- Helm takes the container port from `tracearr.env.PORT`; compose examples treat PORT as the host port

