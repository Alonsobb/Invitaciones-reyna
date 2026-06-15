FROM nginx:alpine

# Copiar archivos del sitio al directorio público de nginx
COPY invitacion.html /usr/share/nginx/html/index.html
COPY images/ /usr/share/nginx/html/images/

# Configuración nginx para servir archivos estáticos correctamente
RUN echo 'server { \
    listen 80; \
    server_name _; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ =404; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
