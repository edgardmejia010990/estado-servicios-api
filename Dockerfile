# Imagen minima de produccion: sin npm, sin yarn y sin shell
FROM gcr.io/distroless/nodejs22-debian12:nonroot

WORKDIR /app

# Copiamos solo lo necesario para ejecutar la app
COPY package.json index.js ./

EXPOSE 3000

# En distroless el entrypoint ya es "node", por eso solo pasamos "index.js"
CMD ["index.js"]
