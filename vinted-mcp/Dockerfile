FROM ghcr.io/home-assistant/base:latest

ARG VINTED_COMMIT=992d476cd846d0762e16a3c3913912e1a12d9cdd

RUN apk add --no-cache nodejs npm jq git \
    && npm install --global --omit=dev "git+https://github.com/andrijdavid/vinted-mcp.git#${VINTED_COMMIT}"

COPY --chmod=0755 run.sh /run.sh

EXPOSE 3001

CMD ["/run.sh"]