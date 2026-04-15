FROM node:20-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/EvolutionAPI/evolution-api.git . &&     npm install --legacy-peer-deps &&     npm run build 2>/dev/null || true

EXPOSE 8080

CMD ["node", "dist/main.js"]
