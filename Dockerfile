FROM node:18

# Usa el directorio raíz como base
WORKDIR /usr/src/app

# Copia todos los archivos del proyecto
COPY . .

# Instala todas las dependencias del monorepo
RUN npm install

# Construye el frontend con turbo
RUN npx turbo run build

# Expón el puerto por defecto (Next.js)
EXPOSE 3000

# Inicia el frontend de Rybbit
CMD ["npm", "--prefix", "apps/web", "start"]
