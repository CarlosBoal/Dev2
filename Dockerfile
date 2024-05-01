# Usa a imagem base do Node.js para construir a aplicação
FROM node:14 as build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia todos os arquivos do diretório atual para o diretório de trabalho
COPY . .

# Constrói a aplicação React
RUN npm run build

# Usa a imagem de produção leve do Nginx como base
FROM nginx:alpine

# Copia os arquivos da aplicação React construída para o diretório de publicação do Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expor a porta 80 para que a aplicação seja acessível externamente
EXPOSE 80

# Comando de inicialização do Nginx
CMD ["nginx", "-g", "daemon off;"]
