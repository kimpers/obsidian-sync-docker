FROM node:22-bookworm-slim

RUN npm install -g obsidian-headless

RUN mkdir -p /obsidian-vault && chown -R node:node /obsidian-vault

USER node
WORKDIR /obsidian-vault

CMD ["ob", "sync", "--path", "/obsidian-vault", "--continuous"]
