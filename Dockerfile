FROM node:18

# Instala pnpm globalmente
RUN npm install -g pnpm

# Crea el directorio de trabajo
WORKDIR /app

# Copia el monorepo completo
COPY . .

# Instala las dependencias de todo el monorepo con pnpm
RUN pnpm install

# Construye todo con turbo
RUN pnpm turbo run build

# Expone el puerto de Next.js
EXPOSE 3000

# Ejecuta la app frontend
CMD ["pnpm", "--filter", "web", "start"]
