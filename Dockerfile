FROM node:22-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos los archivos de la aplicacion
COPY package.json index.js ./

# Buena practica DevSecOps: no correr como root
USER node

# Puerto que expone la API
EXPOSE 3000

# Comando de inicio
CMD ["npm", "start"]
