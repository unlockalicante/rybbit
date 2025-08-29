FROM node:18

# Instala pnpm globalmente
RUN npm install -g pnpm

# Establece la carpeta de trabajo como raíz del repo
WORKDIR /usr/src/app

# Copia el contenido del repo al contenedor
COPY . .

# Instala dependencias del monorepo
RUN pnpm install

# Construye todas las apps
RUN pnpm turbo run build

# Expón el puerto por defecto de Next.js
EXPOSE 3000

# Ejecuta el frontend de Rybbit desde apps/web
CMD ["pnpm", "--filter", "web", "start"]
