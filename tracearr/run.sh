#!/usr/bin/with-contenv bash
set -e

BASE="/config/tracearr"

echo "[Tracearr] Ensuring persistent storage in ${BASE}"

mkdir -p \
  ${BASE}/postgres \
  ${BASE}/redis \
  ${BASE}/tracearr \
  ${BASE}/backup

# Remove transient locations if they exist
rm -rf /data/postgres /data/redis /data/tracearr /data/backup || true

ln -s ${BASE}/postgres  /data/postgres
ln -s ${BASE}/redis     /data/redis
ln -s ${BASE}/tracearr  /data/tracearr
ln -s ${BASE}/backup    /data/backup

echo "[Tracearr] Persistent storage wired up successfully"

exec /entrypoint-supervised.sh
