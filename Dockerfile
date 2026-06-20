FROM alpine:3.19 AS builder
WORKDIR /app
COPY *.html ./
COPY style.css ./

FROM nginx:alpine AS final
COPY --from=builder /app/*.html /usr/share/nginx/html/
COPY --from=builder /app/style.css /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]