---
name: openclaw-maintenance
description: Inspect OpenClaw version and runtime status, explain update commands, perform safe upgrades, restart and verify the gateway, collect diagnostics after failed updates, and guide rollback or channel switching. Use when the user asks to check the current OpenClaw version, update OpenClaw, explain what each OpenClaw maintenance command does, fix a broken OpenClaw installation, or manage stable/beta/dev channels.
---

# OpenClaw Maintenance

Use local OpenClaw commands and local OpenClaw docs first.

## Core goals

- Tell the user the current version and whether an update is available.
- Prefer the safest update path for the detected install type.
- Verify the gateway after every update.
- If the update fails, capture the exact error before suggesting fixes.
- Explain commands in plain language when the user is learning the workflow.

## Default workflow

### 1) Inspect current state

Run:

- `openclaw --version`
- `openclaw status`
- `openclaw update status` when available

Use `scripts/check_update.sh` for a compact status summary.

### 2) Choose the update path

Prefer this order:

1. `openclaw update`
2. `npm i -g openclaw@latest`
3. `pnpm add -g openclaw@latest`

Use `openclaw update` when the installed CLI supports it and the user wants the newest version on the current channel.

### 3) Verify after update

Always run:

- `openclaw doctor`
- `openclaw gateway status`
- `openclaw health`

If the gateway did not come back cleanly, run `openclaw gateway restart` and re-check health.

Use `scripts/update_and_verify.sh` to execute the full safe path.

### 4) If something breaks

Collect evidence before guessing:

- `openclaw status`
- `openclaw doctor`
- `openclaw logs --follow` or recent log tail
- exact stderr from the failed update command

### 5) Rollback / channels

When the user wants to pin or switch behavior:

- `openclaw update --channel stable`
- `openclaw update --channel beta`
- `openclaw update --channel dev`
- `npm i -g openclaw@<version>` for pinning a known-good version

## Command explanation policy

If the user asks how to do the update manually, explain each command in one short line:

- what it changes
- whether it may restart the gateway
- what verification command should follow it

## macOS notes

- The macOS app expects an external global `openclaw` CLI install.
- Updating the CLI may restart or reconnect the local gateway service.
- If app and CLI versions drift, update the CLI to match the app.

## Safety rules

- Warn that updating may restart the gateway.
- Prefer non-destructive checks before modifying anything.
- Do not invent OpenClaw commands.
- For OpenClaw semantics, consult local docs under the installed `openclaw/docs` tree first.
- If the update fails, stop and present the exact error.
