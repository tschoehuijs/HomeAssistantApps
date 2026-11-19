FROM debian:bookworm-slim

ARG MCP_AUTH_VERSION=2.11.0

RUN set -eu; \
    test "$(dpkg --print-architecture)" = "arm64"; \
    apt-get update; \
    apt-get install -y --no-install-recommends ca-certificates curl jq; \
    rm -rf /var/lib/apt/lists/*; \
    curl --fail --show-error --silent --location --retry 3 \
        "https://github.com/sigbit/mcp-auth-proxy/releases/download/v${MCP_AUTH_VERSION}/mcp-auth-proxy-linux-arm64" \
        --output /usr/local/bin/mcp-auth-proxy; \
    echo "f7055a30363ff9b986bcaa1b09790f2c214b8c845588144cc4d64c1701b23561  /usr/local/bin/mcp-auth-proxy" \
        | sha256sum --check -; \
    chmod 0755 /usr/local/bin/mcp-auth-proxy

COPY run.sh /usr/local/bin/run.sh
RUN chmod 0755 /usr/local/bin/run.sh
WORKDIR /data
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/run.sh"]
