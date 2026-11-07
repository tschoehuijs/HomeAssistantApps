#!/bin/sh
set -eu

CONFIG=/data/options.json

export VINTED_MCP_TRANSPORT=http
export VINTED_MCP_HOST=0.0.0.0
export VINTED_MCP_PORT=3001
export VINTED_MCP_PATH=/mcp
export VINTED_MCP_ENABLE_LEGACY_SSE=false

export VINTED_AUTH_MODE="$(jq -r '.auth_mode // "http"' "$CONFIG")"
export VINTED_AUTH_COOKIES="$(jq -r '.auth_cookies // ""' "$CONFIG")"
export VINTED_AUTH_CSRF_TOKEN="$(jq -r '.auth_csrf_token // ""' "$CONFIG")"

cd /opt/vinted-mcp
exec npm start