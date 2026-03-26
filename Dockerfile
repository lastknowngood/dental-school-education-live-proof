FROM nginx:1.29-alpine

COPY index.html /usr/share/nginx/html/index.html
COPY robots.txt /usr/share/nginx/html/robots.txt
COPY default.conf /etc/nginx/conf.d/default.conf
