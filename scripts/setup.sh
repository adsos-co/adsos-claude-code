#!/usr/bin/env bash
# adsOS connector setup for Claude Code, Codex and Cursor.
# Verifies your connect token live, then writes project-scoped connector config.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BASE_URL="${ADSOS_BASE_URL:-https://adsos.co}"

echo "=== adsOS setup ==="
echo ""

# Pull a 64-hex token out of whatever the user pastes: the /connect/ link,
# the /mcp/ URL, or the bare token.
extract_token() {
  printf '%s' "$1" | grep -oE '[0-9a-f]{64}' | head -1
}

# Live check: call get_status through the tokened connector. A good token
# answers with status text; a dead or expired one answers isError.
validate_token() {
  local tok="$1"
  local body
  body="$(curl -sS --max-time 15 -X POST "$BASE_URL/mcp/$tok" \
    -H "content-type: application/json" \
    -d '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"get_status","arguments":{}}}' \
    || echo '')"
  [[ -n "$body" ]] && ! printf '%s' "$body" | grep -q '"isError":true'
}

TOKEN=""
if [[ -f "$ROOT/.mcp.json" ]]; then
  TOKEN="$(extract_token "$(cat "$ROOT/.mcp.json")" || true)"
  if [[ -n "$TOKEN" ]] && validate_token "$TOKEN"; then
    echo "Already connected: .mcp.json holds a working token. Nothing to do."
    echo "Open your AI in this folder (new session) and say:"
    echo "  You're connected to adsOS. Run get_status and take it from there with me."
    exit 0
  fi
  echo "Existing .mcp.json found but its token no longer works. Let's replace it."
  TOKEN=""
fi

echo "You need your adsOS connect link. It came by email when you requested"
echo "your growth plan. No link yet? Get one at $BASE_URL (takes under a minute)."
echo ""

attempts=0
while (( attempts < 3 )); do
  attempts=$((attempts + 1))
  # -s hides input so the token never echoes or lands in scrollback.
  printf "Paste your connect link or token (input hidden, Enter to quit): "
  read -rs input
  printf "\n"
  [[ -z "$input" ]] && { echo "Skipped. Run ./scripts/setup.sh again when you have your link."; exit 0; }

  TOKEN="$(extract_token "$input" || true)"
  if [[ -z "$TOKEN" ]]; then
    echo "That does not look like an adsOS link or token. Paste the full link from your email."
    continue
  fi
  if validate_token "$TOKEN"; then
    echo "Verified: adsOS answered."
    break
  fi
  echo "adsOS did not accept that token. It may have expired or been replaced;"
  echo "request a fresh link at $BASE_URL and try again."
  TOKEN=""
done
[[ -z "$TOKEN" ]] && { echo "No working token after 3 attempts. Get a fresh link at $BASE_URL"; exit 1; }

URL="$BASE_URL/mcp/$TOKEN"

# Claude Code: project-scoped .mcp.json (read automatically in this folder).
cat > "$ROOT/.mcp.json" <<JSON
{
  "mcpServers": {
    "adsos": {
      "type": "http",
      "url": "$URL"
    }
  }
}
JSON
echo "Wrote .mcp.json (Claude Code)."

# Cursor: project-scoped .cursor/mcp.json.
mkdir -p "$ROOT/.cursor"
cat > "$ROOT/.cursor/mcp.json" <<JSON
{
  "mcpServers": {
    "adsos": {
      "url": "$URL"
    }
  }
}
JSON
echo "Wrote .cursor/mcp.json (Cursor)."

# Codex: global config only, so ask before touching it.
echo ""
if [[ -f "$HOME/.codex/config.toml" ]] && grep -q 'mcp_servers.adsos' "$HOME/.codex/config.toml"; then
  echo "Codex: ~/.codex/config.toml already has an adsos entry. Update it by hand if the token changed."
else
  printf "Add adsOS to Codex too (~/.codex/config.toml)? [y/N] "
  read -r yn
  if [[ "$yn" == "y" || "$yn" == "Y" ]]; then
    mkdir -p "$HOME/.codex"
    printf '\n[mcp_servers.adsos]\nurl = "%s"\n' "$URL" >> "$HOME/.codex/config.toml"
    echo "Added. Restart Codex completely (quit and reopen from a fresh terminal)."
  else
    echo "Skipped. To add it later, append this to ~/.codex/config.toml:"
    echo ""
    echo "  [mcp_servers.adsos]"
    echo "  url = \"$BASE_URL/mcp/<your token>\""
  fi
fi

echo ""
echo "=== Connected ==="
echo "Start a NEW session of your AI inside this folder (a session that was"
echo "already running will not see adsOS; that is normal). Then say:"
echo ""
echo "  You're connected to adsOS. Run get_status and take it from there with me."
echo ""
echo "Faster first session: give your AI read-only platform connections first."
echo "See TOOLS.md (Klaviyo, Meta Ads, Google Ads; a few minutes each, optional)."
