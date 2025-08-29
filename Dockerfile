FROM node:18

# Copiar archivos a la imagen
COPY . /app

# Entrar al directorio de la app
WORKDIR /app

# Instalar dependencias
RUN npm install

# Construir frontend + backend con Turbo
RUN npx turbo run build

# Exponer el puerto usado por Next.js
EXPOSE 3000

# Ejecutar el frontend
CMD ["npm", "--prefix", "apps/web", "start"]
