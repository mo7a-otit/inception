#!/bin/sh
sleep 5
cd /var/www/wordpress
if [ ! -f "wp-config.php" ]; then

    wp core download --allow-root
    wp config create --dbname="$SQL_DATABASE" \
        --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" \
        --dbhost="mariadb" --dbcharset="utf8" --dbcollate="utf8_general_ci" \
        --skip-check --allow-root
    wp core install --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" --admin_user="$SQL_USER" \
        --admin_password="$SQL_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
        
    wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root

fi
exec /usr/sbin/php-fpm7.4 -F
