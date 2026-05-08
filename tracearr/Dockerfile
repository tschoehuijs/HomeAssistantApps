FROM ghcr.io/connorgallopo/tracearr:supervised

# Create /run.sh inside the image (avoids CRLF/shebang issues from GitHub Desktop/Windows)
RUN set -eux; \
  cat > /run.sh <<'EOF'\n\
#!/bin/sh\n\
set -e\n\
exec /entrypoint-supervised.sh\n\
EOF\n\
  && chmod 755 /run.sh \
  && ls -la /run.sh

# Ensure the container runs the script in a predictable way
CMD ["sh", "/run.sh"]
