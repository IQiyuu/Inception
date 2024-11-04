#!/bin/sh

echo "OUI " $MYSQL_DB

# lance mysql
service mysql start;

# creer la database '$SQL_DATABASE' si elle n existe pas deja
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
echo "DDDDDDDDBBBBBBBBBBB"
# pareil qu au dessus mais avec un user + son password
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\` IDENTIFIED BY \`${MYSQL_PASSWORD}\`;"

# on lui donne tous les privileges histoire qu'il puisse manipule la table (.* toutes les tables de la db) 
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASS}';"

# on change le mot de pass du root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# on update les changements fait au dessus
mysql -e "FLUSH PRIVILEGES;"

# eteind mysql
mysqladmin -u root -p $MYSQL_PASSWORD shutdown

# la way recommande pour lancer mysql
exec mysqld_safe