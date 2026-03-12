#!/usr/bin/env bash
set -euo pipefail

echo '[1/5] Current version'
openclaw --version

echo '\n[2/5] Updating OpenClaw'
openclaw update

echo '\n[3/5] Running doctor'
openclaw doctor

echo '\n[4/5] Checking gateway'
openclaw gateway status

echo '\n[5/5] Health check'
openclaw health
