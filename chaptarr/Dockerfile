FROM chaptarr/chaptarr:latest

# Run as Root for HAOS add-on compatibility
ENV PUID=0
ENV PGID=0

# Force data to HA config subfolder
ENV DATA_DIR=/config/addons_config/chaptarr

CMD ["dotnet", "/app/Chaptarr.dll", "-nobrowser", "-data=/config/addons_config/chaptarr"]
