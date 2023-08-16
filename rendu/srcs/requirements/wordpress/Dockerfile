FROM debian:bullseye

RUN apt-get update -y && apt upgrade -y         \
    && apt-get install php7.4-fpm php-mysql -y  \
    && apt-get install mariadb-client -y        \
    && apt-get install curl -y                  \
    && apt-get install wget -y                  \
    && apt-get install php-cli -y               \
    && apt-get install php-mbstring -y          \
    && apt-get install php-xml -y               \
    && apt-get install sendmail -y              \
    && apt-get install vim -y

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/wordpress_script.sh /

ENTRYPOINT [ "/wordpress_script.sh" ]

EXPOSE 9000

