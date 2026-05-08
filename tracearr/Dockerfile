FROM ghcr.io/connorgallopo/tracearr:supervised

COPY run.sh /run.sh

# Prove at BUILD TIME what's inside the image and whether the file is executable / has CRLF
RUN set -eux; \
    ls -la /run.sh; \
    file /run.sh || true; \
    head -n 1 /run.sh | cat -A; \
    sed -n '1,3p' /run.sh | cat -A; \
    chmod 755 /run.sh; \
    ls -la /run.sh

CMD ["sh", "/run.sh"]
``
