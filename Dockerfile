FROM node:18

WORKDIR /app

COPY . .

# Instala todas las dependencias del monorepo
RUN npm install

# Ejecuta el build global (Turbo)
RUN npx turbo run build

# Expone el puerto 3000 para el frontend
EXPOSE 3000

# Lanza el frontend desde apps/web
CMD ["npm", "--prefix", "apps/web", "start"]
