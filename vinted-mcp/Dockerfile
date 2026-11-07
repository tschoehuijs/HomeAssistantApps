FROM ghcr.io/home-assistant/base:latest

ARG VINTED_VERSION=0.1.2
RUN apk add --no-cache nodejs npm jq \
    && npm install --global --omit=dev "@andrijdavid/vinted-mcp@${VINTED_VERSION}"

COPY --chmod=0755 run.sh /run.sh
EXPOSE 3001
CMD ["/run.sh"]
