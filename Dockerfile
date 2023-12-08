FROM node:alpine3.16
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build
Run npm start

EXPOSE 3000
