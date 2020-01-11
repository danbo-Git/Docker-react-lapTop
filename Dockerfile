# Build Phase ... Includes all of the Dependancies 
FROM node:alpine as builder 
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# Running Phase ...
# NOTE: See https://hub.docker.com/_/nginx ; Hosting simple static content. aka /usr/share/nginx/html

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html