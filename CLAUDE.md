# adsOS workspace

This folder connects your session to adsOS, a marketing department for your AI. The connector is configured in `.mcp.json` (server name: `adsos`).

## Session rules

- **Start with `get_status`.** It tells you exactly where this account is in the flow and what to do next. Do not guess the state.
- **If the adsos tools are not visible**, the session started before the connector was configured. Tell the user to restart the session from inside this folder. If `.mcp.json` is missing, have them run `./scripts/setup.sh` with the connect link from their adsOS email.
- **The flow runs through the tools**: `get_status` then `get_intake_questions` then `submit_intake` then `get_audit_instructions` then `submit_audit` then `check_report`. Work through the intake with the user in plain conversation. Gather real numbers with the user's approval; never invent or estimate metrics on their behalf.
- **After the user has an active subscription**, this same connector runs the paid workers: `open_session`, `ask_director`, `ask_manager`, `run_specialist`. Nothing more to install.
- **The token inside `.mcp.json` is a private credential.** Never commit it, print it, or share it. It is gitignored; keep it that way.
- **Faster sessions**: `TOOLS.md` lists optional read-only platform connections (Klaviyo, Meta Ads, Google Ads). They let you pull numbers directly instead of asking the user for exports. Offer them; never require them.
- `./scripts/check-adsos.sh` runs a live connection check.
