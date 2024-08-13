# environnement de la machine (debian>alpine car plus light)
FROM debian:buster

# update apt (apk = apt)
RUN apt update -y

RUN apt-get install -y wget

RUN apt-get install -y  php7.3\
						php7.3-fpm\
						php7.3-mysql\
						mariadb-client

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# on telecharge la version FR 6.0 de wordpress dans /var/www
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# on decompresse l'archive de wordpress dl et on la supprime
RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm -rf wordress-6.0-fr_FR.tar.gz

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf /var/www/

COPY ./conf/wp_auto_config.sh /var/www/wp_auto_config.sh

CMD ["bash", "/var/www/wp_auto_config.sh"]