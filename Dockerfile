FROM node:18-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN  npm install
#might need in the future builds
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html