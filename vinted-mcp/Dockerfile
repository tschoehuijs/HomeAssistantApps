FROM ghcr.io/home-assistant/base:latest

ARG VINTED_COMMIT=992d476

RUN apk add --no-cache nodejs npm jq git \
    && git clone https://github.com/andrijdavid/vinted-mcp.git /tmp/vinted-mcp \
    && cd /tmp/vinted-mcp \
    && git checkout "${VINTED_COMMIT}" \
    && npm install \
    && npm run build \
    && npm install --global . \
    && cd / \
    && rm -rf /tmp/vinted-mcp

COPY --chmod=0755 run.sh /run.sh

EXPOSE 3001

CMD ["/run.sh"]