# Usa una imagen de Node LTS
FROM node:18

# Establece directorio de trabajo
WORKDIR /app

# Copia el contenido del repo al contenedor
COPY . .

# Instala dependencias
RUN npm install

# Construye el frontend
RUN npm run build

# Expone el puerto por defecto (si usas Next.js será 3000)
EXPOSE 3000

# Comando de arranque
CMD ["npm", "start"]
