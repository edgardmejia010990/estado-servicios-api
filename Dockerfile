FROM node:22-alpine

# Actualizamos paquetes base y eliminamos npm/yarn/corepack (no se necesitan en runtime)
RUN apk upgrade --no-cache && \
    rm -rf /usr/local/lib/node_modules/npm \
           /usr/local/lib/node_modules/corepack \
           /opt/yarn* \
           /usr/local/bin/npm \
           /usr/local/bin/npx \
           /usr/local/bin/yarn \
           /usr/local/bin/yarnpkg

WORKDIR /app

COPY package.json index.js ./

USER node

EXPOSE 3000

# Arrancamos directo con node (sin npm)
CMD ["node", "index.js"]
