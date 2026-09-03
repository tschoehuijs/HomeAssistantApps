ARG BUILD_VERSION
# Added the 'v' before the version variable so it matches Wizarr's tags exactly
FROM ghcr.io/wizarrrr/wizarr:v${BUILD_VERSION}

# Force Wizarr to save to HAOS's persistent /data volume
ENV DB_DIR=/data/database
ENV STORAGE_DIR=/data/storage

EXPOSE 5690
