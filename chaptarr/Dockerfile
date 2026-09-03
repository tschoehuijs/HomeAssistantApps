ARG BUILD_VERSION
FROM chaptarr/chaptarr:${BUILD_VERSION}

# Run as Root for HAOS add-on compatibility
ENV PUID=0
ENV PGID=0

# Force data to HA's native add-on data folder instead of polluting your main config folder
ENV DATA_DIR=/data

CMD ["dotnet", "/app/Chaptarr.dll", "-nobrowser", "-data=/data"]
