#!/bin/bash

chmod 755 /var/lib/mysql/
chown -R mysql:mysql /var/lib/mysql/
service mariadb start

# Wait for MariaDB to start
sleep 2 

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > /tmp/init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';" >> /tmp/init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> /tmp/init.sql
echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
# echo "ALTER USER '$DB_ROOT'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';" >> /tmp/init.sql
# echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
mariadb < /tmp/init.sql
rm /tmp/init.sql
# mysql $DB_NAME -u$DB_ROOT -p$DB_ROOT_PWD < /tmp/dump.sql

service mariadb stop #root로 실행시키기 
# mariadbd --user=root
mariadbd

