# Obsidian Headless Docker

Runs `obsidian-headless` in continuous sync mode with the vault mounted at `/obsidian-vault`.

## First-Time Setup

Build the image:

```bash
docker compose build
```

Log in to Obsidian:

```bash
docker compose run --rm obsidian-headless ob login
```

List remote vaults:

```bash
docker compose run --rm obsidian-headless ob sync-list-remote
```

Connect the mounted vault directory to a remote vault:

```bash
docker compose run --rm obsidian-headless ob sync-setup --vault "My Vault" --path /obsidian-vault
```

If your vault uses end-to-end encryption, add `--password` or let the command prompt for it.

## Run

```bash
docker compose up -d
```

The service runs:

```bash
ob sync --path /obsidian-vault --continuous
```

Vault data is stored in `./vault`. Obsidian Headless login and local configuration data are persisted in the `obsidian-headless-home` Docker volume.

## Useful Commands

Check sync status:

```bash
docker compose exec obsidian-headless ob sync-status --path /obsidian-vault
```

Run a one-time sync:

```bash
docker compose run --rm obsidian-headless ob sync --path /obsidian-vault
```

Unlink the vault:

```bash
docker compose run --rm obsidian-headless ob sync-unlink --path /obsidian-vault
```
