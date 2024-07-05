#!/bin/sh

# lance mysql
service mysql start;

# creer la database '$SQL_DATABASE' si elle n existe pas deja
mysql -e "CREATE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# pareil qu au dessus mais avec un user + son password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\` IDENTIFIED BY \`${SQL_PASSWORD}\`;"

# on lui donne tous les privileges histoire qu'il puisse manipule la table (.* toutes les tables de la db) 
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# on change le mot de pass du root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# on update les changements fait au dessus
mysql -e "FLUSH PRIVILEGES;"

# eteind mysql
mysqladmin -u root -p $SQL_PASSWORD shutdown

# la way recommande pour lancer mysql
exec mysqld_safe