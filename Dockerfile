FROM node:16-alpine as builder

WORKDIR /app

COPY package*.json .

RUN npm install --legacy-peer-deps

COPY . .

RUN npm run build



#Copy the build folder in ./app to nginx
FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html