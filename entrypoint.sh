#!/bin/sh
set -eu

VAULT_PATH="${OBSIDIAN_VAULT_PATH:-/obsidian-vault}"

mkdir -p "$VAULT_PATH/.obsidian"

if [ "$(id -u)" = "0" ]; then
  chown -R node:node "$VAULT_PATH" /home/node
fi

rm -rf \
  "$VAULT_PATH/.obsidian/.sync-lock" \
  "$VAULT_PATH/.obsidian/.sync.lock"

cd "$VAULT_PATH"

if [ "$(id -u)" = "0" ]; then
  exec runuser -u node -- "$@"
fi

exec "$@"
