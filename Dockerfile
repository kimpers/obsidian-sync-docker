FROM node:22-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends util-linux \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g obsidian-headless

RUN mkdir -p /obsidian-vault && chown -R node:node /obsidian-vault

COPY entrypoint.sh /usr/local/bin/obsidian-headless-entrypoint
RUN chmod +x /usr/local/bin/obsidian-headless-entrypoint

WORKDIR /obsidian-vault

ENTRYPOINT ["obsidian-headless-entrypoint"]
CMD ["ob", "sync", "--path", "/obsidian-vault", "--continuous"]
