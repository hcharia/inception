#!/bin/sh

mysql_install_db --user=mysql --ldata=/var/lib/mysql

mysqld --user=mysql --console &

# Wait for MySQL to start
until mysqladmin ping --silent; do
    echo 'Waiting for MySQL to start...'
    sleep 1
done

mysql -u root --execute="FLUSH PRIVILEGES;"
mysql -u root --execute="CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};"
mysql -u root --execute="CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root --execute="GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root --execute="FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec $@