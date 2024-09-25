# Stufe 1: Build-Phase
FROM node:16-alpine AS builder

# Arbeitsverzeichnis setzen
WORKDIR /app

# Kopiere package.json und installiere Abhängigkeiten
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Kopiere restlichen Quellcode und baue das Projekt
COPY . .
RUN yarn build

# Stufe 2: Produktions-Phase
FROM nginx:alpine

# Entferne den Standard-NGINX-Inhalt und kopiere den Build
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/build /usr/share/nginx/html

# Exportiere den Standard-NGINX-Port
EXPOSE 80

# Starten von NGINX
CMD ["nginx", "-g", "daemon off;"]