FROM node:alpine
LABEL description="Instant high-performance GraphQL API for your PostgreSQL database https://github.com/graphile/postgraphile"

WORKDIR /app

COPY package.json ./
RUN npm install

COPY graphile.config.ts ./
COPY plugins ./plugins

EXPOSE 5678
ENTRYPOINT ["npx", "--no-install", "postgraphile"]
