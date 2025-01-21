# Stage de build
FROM node:20-alpine as builder

WORKDIR /app

# Installation des dépendances
COPY package*.json ./
RUN npm ci

# Build de l'application
COPY . .
RUN npm run build
RUN npm prune --production

# Stage de production
FROM node:20-alpine

WORKDIR /app

# Copie des fichiers nécessaires
COPY --from=builder /app/build ./build
COPY --from=builder /app/node_modules ./node_modules
COPY package.json .

# Configuration de l'environnement
ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000

# Démarrage de l'application
CMD ["node", "./build"] 