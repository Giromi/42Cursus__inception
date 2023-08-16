FROM debian:bullseye

RUN apt-get update -y && apt upgrade -y
RUN apt-get install php7.4-fpm php-mysql -y

# bullseye버젼에 맞는 mysql
RUN apt-get install mariadb-client -y
# RUN apt-get install -y default-mysql-client
RUN apt-get install curl -y

RUN apt-get install wget -y
RUN apt-get install php-cli -y
RUN apt-get install php-mbstring -y
RUN apt-get install php-xml -y
RUN apt-get install sendmail -y
RUN apt-get install vim -y

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/wordpress_script.bash /

ENTRYPOINT [ "/wordpress_script.bash" ]

EXPOSE 9000

