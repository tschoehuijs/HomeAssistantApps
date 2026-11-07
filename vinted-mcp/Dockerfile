ARG BUILD_FROM=node:22-alpine
FROM ${BUILD_FROM}

RUN apk add --no-cache jq \
    && npm install --global --omit=dev @andrijdavid/vinted-mcp

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 3001
CMD ["/run.sh"]
