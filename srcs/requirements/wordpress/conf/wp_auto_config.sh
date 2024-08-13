#!/bin/sh

echo "bip bip"

mkdir -p /var/www/html

chown -R root:root /var/www/wordpress

# dl l archive de wp
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# on la rend executable
chmod +x wp-cli.phar

# on la move pour pouvoir lancer l exec dans bash a la place de wp
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/wordpress

wp core download --allow-root

wp user create $MYSQL_USER $MYSQL_MAIL --role=author --user_pass=$MYSQL_PASS --allow-root

wp config create	--allow-root \
					--dbname=$MYSQL_DB \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASS \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

/usr/sbin/php-fpm7.3 -F