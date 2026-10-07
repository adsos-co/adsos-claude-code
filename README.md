# adsOS: the advanced lane

**adsOS is a marketing department on one screen.** A Director sets the priorities, a Manager assigns the work, and specialists deliver it; you approve what runs at **[adsos.co/app](https://adsos.co/app)**. Start with the free site analysis at **[adsos.co/go](https://adsos.co/go)**: your fixes become your first tasks, and the growth plan follows.

This repository is the **advanced lane**: it puts the same team inside the AI tool you already work in (**Claude Code**, **Codex** or **Cursor**), so your own AI can run the intake, read the plan and talk to the crew from your terminal. Everything it can do, the dashboard does on screen too; nothing here is required.

## Who this is for

- You live in Claude Code, Codex or Cursor and want the adsOS crew reachable from there.
- You want your own AI to carry the adsOS plan into the rest of your work (your codebase, your content, your ops).

If that is not you, skip the repo entirely: [adsos.co/go](https://adsos.co/go) is the front door and the dashboard carries everything.

## What you get

The same account, the same plan, the same crew. Pricing is public at [adsos.co/#pricing](https://adsos.co/#pricing): Core $29 a month with 1,500 credits, Growth $79 with 4,500, Pro $149 with 12,000, Agency $499 with 40,000. Annual is ten months for twelve, and the first month is 20% off on monthly. The free site analysis and the report cost nothing and need no card, and verifying your email adds 50 free credits to start.

## Quick start (about 5 minutes)

### 1. Get your connect link

Sign in at **[adsos.co/app](https://adsos.co/app)** (an email code; the free analysis at [adsos.co/go](https://adsos.co/go) opens the account) and open **Settings, then Advanced**. Your connect link is there. It is a private credential: treat it like a password.

### 2. Clone this repo and run setup

```bash
git clone https://github.com/adsos-co/adsos-claude-code.git
cd adsos-claude-code
./scripts/setup.sh
```

Setup asks for your connect link (input hidden), verifies it against adsOS live, and writes the connector config for Claude Code and Cursor into this folder. Codex users get the exact block to paste, or setup can add it for you.

Your token stays on your machine. The files that hold it are ignored by git and are never committed.

### 3. Open your AI in this folder and start

Start a **new** session (a session that was already running will not see the new connector; that is normal, not a failure).

Say this:

> You're connected to adsOS. Run get_status and take it from there with me.

Your AI fetches the intake questions, works through them with you in plain conversation, gathers your marketing numbers with your approval, and submits. The report lands at your email and your AI gets the link too.

## Connections

Your marketing platforms connect to adsOS once, on the dashboard's Connections page (Meta, Klaviyo, your store; Google Ads coming). The public guides are at [adsos.co/tools](https://adsos.co/tools). Every connection you add makes both the dashboard and this lane faster and sharper. **[TOOLS.md](TOOLS.md)** covers the optional extra: giving your own AI read-only tools of its own, so it can pull numbers for you directly inside your terminal.

## What stays on your machine

The token in this folder never leaves it (gitignored, never committed). Platform tokens you connect on the dashboard are sealed in a vault and destroyed the moment you disconnect.

## Troubleshooting

| Symptom | Fix |
|---|---|
| adsOS tools not showing in the session | Restart your AI (new session) from inside this folder. Connectors are read at session start. |
| "This link has expired or been replaced" | Copy the current link from Settings, then Advanced at [adsos.co/app](https://adsos.co/app), and run `./scripts/setup.sh` again. |
| Not sure if you are connected | Run `./scripts/check-adsos.sh` for a live status check. |

## What is adsOS?

Your marketing department, on one screen, from [AZUA, LLC](https://adsos.co). How it works: [adsos.co/how](https://adsos.co/how). This repository is the advanced lane for operators who want their own AI in the loop.

adsOS is a product of AZUA, LLC · 2093 Philadelphia Pike, Suite 5280, Claymont, DE 19703, USA
