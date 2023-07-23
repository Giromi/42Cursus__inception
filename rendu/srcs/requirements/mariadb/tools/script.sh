#!/bin/sh

chown -R 777 /var/lib/mysql
service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > /tmp/init.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';" >> /tmp/init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> /tmp/init.sql
echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
mysql < /tmp/init.sql
rm /tmp/init.sql

service mariadb stop #root로 실행시키기 
mariadbd --user=root


# chmod -R 777 /var/lib/mysql/
#
# service mysql start
#
# if [ ! -d "/var/lib/mysql/$DB_NAME" ];then
# 	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
# 	mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD'";
# 	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'";
# 	mysql -e "FLUSH PRIVILEGES;"
# 	mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# 	mysql -e "FLUSH PRIVILEGES;"
# 	mysql $DB_NAME -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD < /tmp/wpdb_dump.sql
# fi
#
#
#
