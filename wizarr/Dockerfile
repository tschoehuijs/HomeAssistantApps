ARG BUILD_VERSION
FROM ghcr.io/wizarrrr/wizarr:${BUILD_VERSION}

# Force Wizarr to save to HAOS's persistent /data volume
ENV DB_DIR=/data/database
ENV STORAGE_DIR=/data/storage

EXPOSE 5690
