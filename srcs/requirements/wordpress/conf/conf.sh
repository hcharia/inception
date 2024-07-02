#!/bin/sh
sleep 5

if [ ! -f "wp-config.php" ]; then
wp config create --allow-root --dbname="${DATABASE_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="mariadb"
wp core install --url="${DN}" --title="${TITLE}" --admin_user="${WP_USER}" --admin_password="${WP_PASSWORD}" --admin_email="${WP_EMAIL}" --allow-root
wp user create "${WP_MAN}" "${WP_MANMAIL}" --user_pass="${WP_MANPASS}" --role=editor --allow-root
fi

chmod -R 777 wp-content/

exec $@