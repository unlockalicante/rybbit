FROM node:18

# Establecer el directorio raíz del proyecto (sin crear /app innecesario)
WORKDIR /app

# Copiar los archivos del repo
COPY . .

# Volver al raíz para instalar correctamente
WORKDIR /app

# Instalar todas las dependencias
RUN npm install

# Construir todo el monorepo con Turbo
RUN npx turbo run build

# Exponer el puerto del frontend (Next.js usa 3000 por defecto)
EXPOSE 3000

# Lanzar el frontend de Rybbit desde apps/web
CMD ["npm", "--prefix", "apps/web", "start"]
