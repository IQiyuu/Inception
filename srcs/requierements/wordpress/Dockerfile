# environnement de la machine (debian>alpine car plus light)
FROM alpine:3.20.1

# update apk (apk = apt)
RUN apk update

# upgrade apk (apk = apt)
RUN apk upgrade

# install wget
RUN apk add wget

# install PHP et ses dependences
RUN apk install php7.3\
php-fpm\
php-mysql\
mariadb-client

# on telecharge la version FR 6.0 de wordpress dans /var/www
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# on decompresse l'archive de wordpress dl et on la supprime
RUN cd /var/www && tar -xvf wordress-6.0-fr_FR.tar.gz && rm -rf wordress-6.0-fr_FR.tar.gz

# on change le owner de wordpress
RUN chown -R root:root /var/www/wordpress