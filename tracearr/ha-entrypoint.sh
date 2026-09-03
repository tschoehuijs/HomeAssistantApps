#!/bin/sh
set -e

mkdir -p /data/backup
chown tracearr:tracearr /data/backup

exec /entrypoint.sh "$@"
