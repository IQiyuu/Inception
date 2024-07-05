# environnement de la machine (debian>alpine car plus light)
FROM alpine:3.20.1

# apk = apt de debian
RUN apk upgrade
RUN apk update

# on installe mariadb
RUN apk add mariadb

# COPY le fichier conf dans le container
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# COPY le script run qui setup mysql et l executer
ADD tools/run.sh .
RUN chmod +x /run.sh

ENTRYPOINT ["./run.sh"]