#!/usr/bin/env bash
# SessionStart orientation banner. Local checks only; no network calls.
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
if [[ -f "$ROOT/.mcp.json" ]] && grep -qE '[0-9a-f]{64}' "$ROOT/.mcp.json"; then
  echo "[adsOS] Connector configured (.mcp.json). Start with the get_status tool."
  echo "[adsOS] If the adsos tools are not visible, this session started before setup ran: restart the session."
else
  echo "[adsOS] Not connected yet. The user should run ./scripts/setup.sh with the connect link from their adsOS email (from adsos.co)."
fi
exit 0
