#!/bin/sh

if  ! /usr/local/bin/wp --allow-root core --path=/var/www/html is-installed; then
	/usr/local/bin/wp --path=/var/www/html core download --allow-root
	echo "************************* Got wordpress *****************************"
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wp-config.php
	sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config.php
	sed -i "s/localhost/$MYSQL_HOST/g" /var/www/html/wp-config.php
	while ! wp --allow-root --path=/var/www/html db check; do
		sleep 1
	done
	wp core install --path=/var/www/html --url=agrotzsc.42.fr \
	--title='Wordpress for project inception' \
	--admin_user=supervisor --admin_password=$WP_PASSWORD \
	--admin_email=supervisor@42.fr --allow-root \
	--skip-email

	wp --path=/var/www/html user create agrotzsc agrotzsc@42.fr \
	--role=author --user_pass=$WP_PASSWORD --allow-root
	
	wp --path=/var/www/html --allow-root config set WP_REDIS_HOST redis
	wp --path=/var/www/html --allow-root config set WP_REDIS_SCHEME 'tcp'
	wp --path=/var/www/html --allow-root config set WP_REDIS_PORT 6379
	wp --path=/var/www/html --allow-root config set WP_CACHE_KEY_SALT 'agrotzsc.42.fr'
	wp --path=/var/www/html --allow-root config set WP_CACHE true
	wp --path=/var/www/html --allow-root plugin install redis-cache --activate
	cp /var/www/html/wp-content/plugins/redis-cache/includes/object-cache.php /var/www/html/wp-content/

fi
chown -R nginx:www-data /var/www/html/*
find /var/www/html -type d -exec chmod 775 {} \;  
find /var/www/html -type f -exec chmod 664 {} \;
chmod g+s /var/www/html
exec /usr/sbin/php-fpm8 -F