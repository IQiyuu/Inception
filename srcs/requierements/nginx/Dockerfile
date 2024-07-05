# environnement de la machine (debian>alpine car plus light)
FROM alpine:3.20.1

# update apk (apk = apt)
RUN apk update

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

# ajoute les droits pour le root
RUN chnod 755 /var/www/html

# ajoute les droits pour le main user
RUN chown -R www-data:www-data /var/www/html

# copy le fichier conf dans le container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# lance nginx en premier plan qu'il se stop pas
CMD [ "nginx", "-g", "daemon off;" ]