FROM alpine:3.20.1

# upgrade apk (apk = apt)
RUN apk upgrade

# install nginx
RUN apk add nginx

# creer un dossier pour stocker la clef ssl
RUN mkdir -p /etc/nginx/ssl

# install ssl pour creer la clef
RUN apk add openssl

# creer le certificat et la clef auto-signee ssl -x le format
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Alsace/L=Mulhouse/O=42/OU=42/CN=dgoubin.42.fr/UID=dgoubin"

# dossier pour les fichiers config de nginx
RUN mkdir -p /var/run/nginx/

COPY conf/nginx.conf /etc/nginx/nginx.conf