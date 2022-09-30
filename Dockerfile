FROM node:16 as base

# diretório criado no container
WORKDIR /usr/src/

# copies our package.json and installs it
COPY package*.json ./ 

# copia todos os arquivos para o container
COPY . . 

RUN npm i 

#production step
FROM base as production

ENV NODE_PATH=./dist

RUN npm run build