FROM nginx:1.22.1
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=ekaterinakaiser/kittygram_frontend /app/build/ /usr/share/nginx/html/
# Не копируем статику, так как она будет монтироваться через тома
