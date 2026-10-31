#!/usr/bin/env bash
set -euo pipefail

echo "[.ai-setup.sh] Initializing user-space environment for Antigravity..."
mkdir -p "$HOME/.local/bin"

# 1. Python setup (cached via .venv and ~/.cache/pip)
if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
  python3 -m venv .venv
  ./.venv/bin/pip install --upgrade pip
  [ -f "requirements.txt" ] && ./.venv/bin/pip install -r requirements.txt
  [ -f "pyproject.toml" ] && ./.venv/bin/pip install -e .
fi

# 2. Node.js setup (cached via node_modules and ~/.npm)
if [ -f "package-lock.json" ]; then
  npm ci --prefer-offline
fi

echo "[.ai-setup.sh] Environment provisioning complete."
