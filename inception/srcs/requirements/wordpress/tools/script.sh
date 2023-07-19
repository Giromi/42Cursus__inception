#!/bin/sh
# mkdir -p /var/www/html
#
# cd /var/www/html
#
# # 기존에 있으면 삭제
# rm -rf *
# WP-CLI를 다운로드합니다.
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# 다운로드한 WP-CLI를 실행 가능하도록 만듭니다.
chmod +x wp-cli.phar

# WP-CLI를 전역적으로 사용할 수 있도록 이동합니다.
mv wp-cli.phar /usr/local/bin/
ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp-cli

ls

# WordPress Core를 다운로드합니다.
mkdir -p /var/www/wordpress

if [ -z "$(ls -A /var/www/wordpress)" ]; then
    echo "< Here is Empty"
    cd /var/www/wordpress
    wp-cli --allow-root core download 
    wp-cli config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=$(DB_HOST) --allow-root
    wp-cli core install --url=localhost --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
else
    echo "< Here is already installed"
fi
# wp-cli-config.php 파일을 생성합니다.
# WordPress를 설치합니다.

php-fpm7.3 -F

#while true; do sleep 30; done;
