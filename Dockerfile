FROM node:alpine3.16
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build
WORKDIR /app/src
CMD [ "node","App.js" ]

EXPOSE 8080
