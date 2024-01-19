FROM node:alpine3.16 as build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest

# Copy Nginx configuration files
#COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/default.conf

# Copy the React builds from the builder stage to the nginx image
COPY --from=build /app/build /usr/share/nginx/html/app


CMD ["nginx", "-g", "daemon off;"]


EXPOSE 3000
