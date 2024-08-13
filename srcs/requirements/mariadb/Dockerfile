# environnement de la machine (debian>alpine car plus light)
FROM debian:buster

# apk = apt de debian
RUN apt update -y

RUN     apt upgrade -y

# on installe mariadb
RUN apt-get install mariadb-server -y

# COPY le fichier conf dans le container
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY le script run qui setup mysql et l executer
ADD tools/run.sh .
RUN chmod +x /run.sh

ENTRYPOINT ["./run.sh"]