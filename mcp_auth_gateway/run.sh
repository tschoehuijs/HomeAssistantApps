#!/bin/sh
set -eu
umask 077
CONFIG=/data/options.json
fail() {
    printf 'ERROR: %s\n' "$1" >&2
    exit 1
}
[ -r "$CONFIG" ] || fail "Cannot read /data/options.json."
EXTERNAL_URL="$(jq -er '.external_url | strings | select(length > 0)' "$CONFIG")" \
    || fail "external_url is required."
BACKEND_URL="$(jq -er '.backend_url | strings | select(length > 0)' "$CONFIG")" \
    || fail "backend_url is required."
PASSWORD="$(jq -er '.password | strings | select(length >= 20)' "$CONFIG")" \
    || fail "Set a unique password of at least 20 characters."
EXTERNAL_URL="${EXTERNAL_URL%/}"
BACKEND_URL="${BACKEND_URL%/}"
case "$EXTERNAL_URL" in
    https://*) ;;
    *) fail "external_url must start with https://." ;;
esac
EXTERNAL_HOST="${EXTERNAL_URL#https://}"
case "$EXTERNAL_HOST" in
    ""|*/*|*@*|*\?*|*\#*)
        fail "external_url must contain only the HTTPS origin, without a path, credentials, query, or fragment."
        ;;
esac
case "$BACKEND_URL" in
    http://*|https://*) ;;
    *) fail "backend_url must start with http:// or https://." ;;
esac
BACKEND_HOST="${BACKEND_URL#*://}"
case "$BACKEND_HOST" in
    ""|*/*|*@*|*\?*|*\#*)
        fail "backend_url must contain only the backend origin, without a path, credentials, query, or fragment."
        ;;
esac
mkdir -p /data/oauth
chmod 0700 /data/oauth
export EXTERNAL_URL PASSWORD
export NO_AUTO_TLS=true
export LISTEN=0.0.0.0:8080
export DATA_PATH=/data/oauth
unset SUPERVISOR_TOKEN HASSIO_TOKEN
printf 'Starting MCP Auth Gateway on port 8080.\n'
printf 'External origin: %s\n' "$EXTERNAL_URL"
printf 'Backend origin: %s\n' "$BACKEND_URL"
exec /usr/local/bin/mcp-auth-proxy "$BACKEND_URL"
