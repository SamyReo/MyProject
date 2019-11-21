FROM node:alpine AS builder

WORKDIR /app
RUN npm install -g @angular/cli
COPY . .

RUN npm install && \
    npm run build

FROM nginx:alpine

COPY --from=builder /app/dist/MyProject/* /usr/share/nginx/html/
