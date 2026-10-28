FROM node:22-bookworm-slim
WORKDIR /app
COPY web/package*.json ./
RUN npm ci
COPY web ./
ARG SEREIN_BASE_PATH=/
ENV SEREIN_BASE_PATH=${SEREIN_BASE_PATH}
RUN npm run build
CMD ["node", "server/gateway.mjs"]
