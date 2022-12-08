#!/bin/sh
mariadb-install-db --user=mysql --ldata=/var/lib/mysql --skip-test-db
mkdir /var/run/mysqld
chown -R mysql:root /var/run/mysqld
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /tmp/sec_install.sql
sed -i "s/MYSQL_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /tmp/sec_install.sql
exec mysqld --user=mysql --init-file=/tmp/sec_install.sql