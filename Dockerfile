FROM node:alpine3.16
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build
CMD [ "node","app.js" ]

EXPOSE 8080
