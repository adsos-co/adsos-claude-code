# adsOS

**Your AI just became a marketing department.**

adsOS gives the AI you already use a complete marketing team to draw on: paid ads, SEO, email, social and analytics specialists, with a director who keeps the whole plan coherent. Your AI connects once. Every session after that works from your real numbers and a plan that holds steady, session after session, even when your AI starts fresh.

Works with **Claude Code**, **Codex** and **Cursor**.

## See what the team can do before you decide anything

The first thing adsOS does is prove itself. Your AI gathers your ad and email numbers with your approval, adsOS digs through them, and you get back a growth plan built from your own data: what is working, what is quietly costing you, and what to do about it, in dollars. That demonstration is on us. If the plan does not earn your attention, you walk away with the plan.

## Quick start (about 5 minutes)

### 1. Get your connect link

Request your growth plan at **[adsos.co](https://adsos.co)**. It arrives by email with your personal connect page and token. Already have the email? You are ready.

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

## Give your AI its tools (optional, recommended)

adsOS works through your AI, so the more of your marketing stack your AI can read, the faster and sharper every session gets: numbers pulled directly instead of asked for, checked instead of remembered. **[TOOLS.md](TOOLS.md)** walks through read-only connections for Klaviyo, Meta Ads and Google Ads, a few minutes each.

None of it is required. If your AI has no tools connected, adsOS walks it through simple exports instead, step by step.

## What stays on your machine

Every platform connection is between your AI and your platform. Your logins, tokens and credentials never touch adsOS. What reaches us is what the work needs: performance numbers, shown to you before they are sent.

## Troubleshooting

| Symptom | Fix |
|---|---|
| adsOS tools not showing in the session | Restart your AI (new session) from inside this folder. Connectors are read at session start. |
| "This link has expired or been replaced" | Request a fresh link at [adsos.co](https://adsos.co); it takes under a minute. Then run `./scripts/setup.sh` again. |
| Not sure if you are connected | Run `./scripts/check-adsos.sh` for a live status check. |

## What is adsOS?

A marketing department for your AI, from [AZUA, LLC](https://adsos.co). How it works: [adsos.co/how](https://adsos.co/how).

adsOS is a product of AZUA, LLC · 2093 Philadelphia Pike, Suite 5280, Claymont, DE 19703, USA
