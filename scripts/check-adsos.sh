#!/usr/bin/env bash
# Live status check against your adsOS connector.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BASE_URL="${ADSOS_BASE_URL:-https://adsos.co}"

[[ -f "$ROOT/.mcp.json" ]] || { echo "Not set up yet: run ./scripts/setup.sh first."; exit 1; }
TOKEN="$(grep -oE '[0-9a-f]{64}' "$ROOT/.mcp.json" | head -1 || true)"
[[ -n "$TOKEN" ]] || { echo ".mcp.json has no token. Run ./scripts/setup.sh again."; exit 1; }

BODY="$(curl -sS --max-time 15 -X POST "$BASE_URL/mcp/$TOKEN" \
  -H "content-type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"get_status","arguments":{}}}')"

if printf '%s' "$BODY" | grep -q '"isError":true'; then
  echo "NOT CONNECTED. adsOS said:"
else
  echo "CONNECTED. adsOS says:"
fi
# Print the status text; fall back to raw JSON if python3 is missing.
printf '%s' "$BODY" | python3 -c 'import json,sys; print(json.load(sys.stdin)["result"]["content"][0]["text"])' 2>/dev/null || printf '%s\n' "$BODY"
