FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY _site/ /usr/share/nginx/html/
RUN chmod 755 /usr/share/nginx/html/