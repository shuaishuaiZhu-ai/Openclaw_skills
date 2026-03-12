#!/usr/bin/env bash
set -euo pipefail

openclaw --version
printf '\n--- STATUS ---\n'
openclaw status
printf '\n--- UPDATE STATUS ---\n'
openclaw update status || true
