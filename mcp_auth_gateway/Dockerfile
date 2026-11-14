FROM debian:bookworm-slim

ARG MCP_AUTH_VERSION=2.10.6

RUN set -eu; \
    test "$(dpkg --print-architecture)" = "arm64"; \
    apt-get update; \
    apt-get install -y --no-install-recommends ca-certificates curl jq; \
    rm -rf /var/lib/apt/lists/*; \
    curl --fail --show-error --silent --location --retry 3 \
        "https://github.com/sigbit/mcp-auth-proxy/releases/download/v${MCP_AUTH_VERSION}/mcp-auth-proxy-linux-arm64" \
        --output /usr/local/bin/mcp-auth-proxy; \
    echo "10370ef8e9daee2b7575959680755f932adfdcd724bba67335bdd3c97da72ecb  /usr/local/bin/mcp-auth-proxy" \
        | sha256sum --check -; \
    chmod 0755 /usr/local/bin/mcp-auth-proxy

COPY run.sh /usr/local/bin/run.sh
RUN chmod 0755 /usr/local/bin/run.sh
WORKDIR /data
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/run.sh"]
