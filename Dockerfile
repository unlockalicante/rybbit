FROM node:18

# Instalar pnpm
RUN npm install -g pnpm

# Establecer directorio de trabajo (en el que Render clona por defecto)
WORKDIR /app

# Copiar todo el contenido al contenedor (desde el contexto raíz del repo)
COPY . .

# Instalar dependencias del monorepo
RUN pnpm install

# Construir todas las apps del monorepo
RUN pnpm turbo run build

# Exponer el puerto por defecto de Next.js
EXPOSE 3000

# Ejecutar el frontend (ajustar si tu app principal es otra)
CMD ["pnpm", "--filter", "web", "start"]
