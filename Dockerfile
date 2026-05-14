# Declare image directly per Supervisor 2026.04.0+ instructions
FROM ghcr.io/wizarrrr/wizarr:latest

# Force Wizarr to save to HAOS's persistent /data volume
ENV DB_DIR=/data/database
ENV STORAGE_DIR=/data/storage

# Add Home Assistant specific labels
LABEL io.hass.version="1.0.0" \
      io.hass.type="addon" \
      io.hass.arch="aarch64|amd64"

EXPOSE 5690
