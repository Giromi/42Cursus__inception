
# https://www.debian.org/releases/

FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y     \
    && apt install php-fpm php-mysql -y         \
    && apt-get install wget unzip -y            \
    && apt-get install vim -y

## Download and install WordPress
# WORKDIR /var/www/html
# RUN wget https://wordpress.org/latest.zip \
#     && unzip latest.zip \
#     && rm latest.zip \
#     && chown -R www-data:www-data /var/www/html/wordpress \
#     && chmod -R 755 /var/www/html/wordpressCOPY /c:nf/default.conf /etc/nginx/conf.d/default.conf

#CMD ["nginx", "-g", "daemon off;"]
EXPOSE 9000
