# Using environment variables in nginx configuration (new in 1.19)
# https://hub.docker.com/_/nginx
# https://devopsian.net/notes/docker-nginx-template-env-vars/

FROM nginx:latest
RUN mkdir /etc/nginx/templates
COPY default.conf.template /etc/nginx/templates
COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
