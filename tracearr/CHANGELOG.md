# Changelog

## 2.6.2

# Tracearr v2.6.2

### New
- Mobile auth replies carry a code: device removed, token expired or unknown, backup restored, or app too old

### Improved
- Phones paired before 1.5.0 move onto the current session type the next time they refresh, without pairing again
- A removed phone is told it was removed for 30 days after the removal, not just until its device entry is gone
- Encrypted push notifications name the device secret they were sealed with, so the app can spot a stale one

### Fixes
- A Redis or Postgres outage answers paired phones with 503 instead of a sign-in error
- The mobile pairing dialog says a token lasts 15 minutes, which is how long it lasts

### Security
- A refresh token that a pre-1.5.0 pairing already rotated away can no longer be replayed later

Other release notes: https://github.com/connorgallopo/Tracearr/releases/tag/v2.6.0

