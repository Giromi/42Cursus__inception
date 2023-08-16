#!bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/
ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp-cli

mkdir -p /var/www/wordpress

if [ -z "$(ls -A /var/www/wordpress)" ]; then
    echo ">>> /var/www/wordpress/* is Empty <<<"
    cd /var/www/wordpress

    wp-cli --allow-root core download 

    wp-cli --allow-root config create   \
        --dbname=$DB_NAME               \
        --dbuser=$DB_USER               \
        --dbpass=$DB_PWD                \
        --dbhost=$DB_HOST

    wp-cli --allow-root core install    \
        --url=$DOMAIN_NAME              \
        --title=$WP_TITLE               \
        --admin_user=$WP_ADMIN_NAME     \
        --admin_password=$WP_ADMIN_PWD  \
        --admin_email=$WP_ADMIN_EMAIL   \
        --skip-email

    wp-cli --allow-root user create $WP_USER_NAME $WP_USER_EMAIL \
        --user_pass=$WP_USER_PWD            \
        --user_url=$WP_USER_URL             \
        --first_name=$WP_USER_FIRST_NAME    \
        --last_name=$WP_USER_LAST_NAME      \
        --role=$WP_USER_ROLE
else
    echo '>>> /var/www/wordpress/* is already installed <<<'
fi

mkdir -p -m 755 /run/php

echo '>>> PHP-FPM is starting <<<'
exec php-fpm7.4 -F

