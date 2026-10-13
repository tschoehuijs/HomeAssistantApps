#!/bin/sh
set -e

mkdir -p /data/backup
chown tracearr:tracearr /data/backup

echo "[HA wrapper] Upstream directory-creation commands:"
grep -n -B 8 -A 8 'mkdir' /entrypoint.sh

exec /entrypoint.sh "$@"
