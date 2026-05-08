#!/bin/bash
set -euo pipefail

BASE="/config"

echo "[Tracearr] Using persistent add-on config folder: ${BASE}"

mkdir -p \
  "${BASE}/postgres" \
  "${BASE}/redis" \
  "${BASE}/tracearr" \
  "${BASE}/backup"

# Ensure Tracearr internal expected paths point to our persisted locations
rm -rf /data/postgres /data/redis /data/tracearr /data/backup || true

ln -s "${BASE}/postgres"  /data/postgres
ln -s "${BASE}/redis"     /data/redis
ln -s "${BASE}/tracearr"  /data/tracearr
ln -s "${BASE}/backup"    /data/backup

echo "[Tracearr] Symlinks:"
ls -la /data || true

# Start the original Tracearr supervised entrypoint
exec /entrypoint-supervised.sh
