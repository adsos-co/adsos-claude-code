# Give your AI its tools

adsOS works through the AI you already use. The more of your marketing stack that AI can read, the faster and sharper every session gets: numbers pulled directly instead of asked for, checked instead of remembered.

**None of this is required.** If your AI has no tools connected, adsOS walks it through simple exports instead, step by step. But the more complete your data, the sharper your report: a few extra minutes here buys a lot in the result.

## What stays on your machine

Every connection on this page is between your AI and your platform. Your logins, tokens and credentials never touch adsOS. What reaches us is what the work needs: performance numbers, shown to you before they are sent.

And here is the part most people miss: **adsOS remembers**. Every session your AI runs with us is stored on our side, with detailed notes. Your assistant's own recall drifts between sessions; ours does not. Connect once, and the plan your AI is working from stays solid, session after session, even when your AI starts fresh.

## Klaviyo (2 minutes)

Klaviyo runs an official hosted connection. You sign in with your normal Klaviyo login the first time it is used; no API keys to handle. The address below is the read-only version, so it can look but never change anything.

Say this to your AI:

> Add the official Klaviyo MCP server to your own configuration as a remote server named "klaviyo", URL https://mcp.klaviyo.com/mcp?read-only=true . Then connect and confirm you can see my account.

On Claude Code it is one command if you would rather do it yourself:

```bash
claude mcp add --transport http klaviyo "https://mcp.klaviyo.com/mcp?read-only=true"
```

Cursor and Codex take the same URL in `~/.cursor/mcp.json` or `~/.codex/config.toml`; your AI can make that edit for you.

## Meta Ads (5 minutes)

Meta runs an official Ads connection you authorize with your normal business login; no developer app needed. It is rolling out gradually, so if your ad account does not have it yet, skip this: the export path covers Meta fine.

Say this to your AI:

> Help me connect Meta's official Ads MCP for my ad account. Start from Meta's AI connectors help page (facebook.com/business/help/1456422242197840). I will sign in with my business login; then add the server URL Meta gives me to your own configuration as a remote server named "meta-ads", and confirm you can read my campaigns.

adsOS never needs read or write access to your ad account. Your own AI handles that, under your direct control, so you check the work as it is being done.

## Google Ads (optional, technical)

Google's official connection is read-only and solid, but the setup is the heaviest on this page: it wants a Google Ads developer token and a Google Cloud project. If that sentence made sense to you, ask your AI to set up [github.com/googleads/google-ads-mcp](https://github.com/googleads/google-ads-mcp) and it will walk you through the credentials.

If it did not, skip it with a clear conscience. Your Google numbers come from a two-minute CSV export your AI walks you through when the time comes. But later on, when the edits get intricate, you will probably want your AI connected here too.

## Shopify (not needed to start)

Your growth plan is computed from ad and email numbers, so nothing here blocks you. Shopify ships official AI connections of its own; if your AI already has one, adsOS will happily use what it can see. Otherwise leave this for later: when we begin working together in earnest you will be needing some on-page optimizations, and your AI will handle our instructions swiftly.

---

Not connected to adsOS yet? Get your growth plan link at [adsos.co](https://adsos.co). It arrives by email with your personal connect page.
