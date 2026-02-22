#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/../deploy.config"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: deploy.config not found."
  echo ""
  echo "Run first-time setup:"
  echo "  cp .cursor/skills/deploy/deploy.config.example .cursor/skills/deploy/deploy.config"
  echo "  # Then edit deploy.config with your server details"
  exit 1
fi

source "$CONFIG_FILE"

: "${SFTP_HOST:?deploy.config must define SFTP_HOST}"
: "${SFTP_USER:?deploy.config must define SFTP_USER}"
: "${REMOTE_PATH:?deploy.config must define REMOTE_PATH}"

FILES=("index.html" "style.css" "script.js")

for f in "${FILES[@]}"; do
  if [ ! -f "$f" ]; then
    echo "Error: $f not found in current directory. Run this script from the project root."
    exit 1
  fi
done

BATCH=$(mktemp)
trap "rm -f $BATCH" EXIT

echo "cd $REMOTE_PATH" >> "$BATCH"
for f in "${FILES[@]}"; do
  echo "put $f" >> "$BATCH"
done
echo "bye" >> "$BATCH"

SSH_KEY_OPT=()
if [ -n "${SSH_KEY:-}" ]; then
  SSH_KEY_OPT=(-i "$SSH_KEY")
fi

echo "Deploying to $SFTP_USER@$SFTP_HOST:$REMOTE_PATH ..."
sftp "${SSH_KEY_OPT[@]}" -b "$BATCH" "$SFTP_USER@$SFTP_HOST"

echo ""
echo "Deploy complete. Files uploaded:"
for f in "${FILES[@]}"; do
  echo "  $REMOTE_PATH/$f"
done
