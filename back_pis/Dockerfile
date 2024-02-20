# Etapa 1: Construcción de la aplicación Node.js
FROM node:20.5.0 AS builder
WORKDIR /workback
COPY package*.json ./
RUN npm install
RUN npm install axios
RUN npm install -g npm@10.4.0
COPY . .

# Etapa 2: Configuración de la base de datos MySQL
FROM mysql:latest AS mysql-setup
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=semaforo_pis
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root
COPY initDB.sql /docker-entrypoint-initdb.d/

# Instalar netcat
RUN apt-get update && apt-get install -y netcat

# Etapa 3: Imagen final
FROM node:20.5.0
WORKDIR /workback

# Copia solo los archivos necesarios de la construcción de la aplicación Node.js
COPY --from=builder /workback /workback

# Puedes agregar más configuraciones o comandos aquí si es necesario
CMD ["npm", "start"]
