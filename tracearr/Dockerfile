FROM ghcr.io/connorgallopo/tracearr:supervised

# Fix /run.sh inside the base image (CRLF/shebang/permissions). If missing, recreate it.
RUN set -eux; \
    if [ -f /run.sh ]; then \
      sed -i 's/\r$//' /run.sh; \
      chmod 755 /run.sh; \
    else \
      cat > /run.sh <<'EOF'\n\
#!/bin/sh\n\
set -e\n\
# Start Tracearr's supervised startup (present in the image)\n\
exec /entrypoint-supervised.sh\n\
EOF\n\
      chmod 755 /run.sh; \
    fi; \
    head -n 1 /run.sh | cat -A
