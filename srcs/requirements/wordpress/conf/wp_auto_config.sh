#!/bin/sh

sleep 10

cd /var/www/wordpress

if [ ! -f wp-config.php ];
then
	ls
	wp config create	--allow-root \
					--dbname=$MYSQL_DB \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASS \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
	echo "2"
	wp core download --allow-root
	echo "3"
	wp user create $MYSQL_USER $MYSQL_MAIL --role=author --user_pass=$MYSQL_PASS --allow-root
	echo "4"
fi

/usr/sbin/php-fpm7.3 -F

echo "7"