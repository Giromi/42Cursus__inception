#!/bin/sh

mkdir -p -m 755 /var/lib/mysql/
chown -R mysql:mysql /var/lib/mysql/


if [ ! -d "/var/lib/mysql/data/" ]; then
    echo '>>> install db <<<'
    /usr/bin/mariadb-install-db	--skip-test-db --user=mysql --datadir=/var/lib/mysql/data
    mariadbd --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
else
    echo '>>> DB is already installed <<<'
fi

mkdir -p -m 755 /run/mysqld
chown -R mysql:mysql /run/mysqld/

echo '>>> MARIADB is starting <<<'
exec mariadbd

