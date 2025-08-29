FROM node:18

# Instala pnpm
RUN npm install -g pnpm

# Establece el directorio correcto desde donde trabajar
WORKDIR /app

# Copia el contenido del proyecto al contenedor
COPY . /app

# Instala las dependencias desde la raíz del monorepo
WORKDIR /app
RUN pnpm install

# Ejecuta la build de todo el monorepo
RUN pnpm turbo run build

# Expón el puerto de Next.js (frontend)
EXPOSE 3000

# Ejecuta el frontend de Rybbit
CMD ["pnpm", "--filter", "web", "start"]
