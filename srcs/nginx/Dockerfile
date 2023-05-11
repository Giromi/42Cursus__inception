
# FROM debain:bullseye <- 첫번째
# https://www.debian.org/releases/
# <- 두번 째

FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
	&& apt-get install nginx -y \
	&& apt-get install openssl -y

RUN service nginx start

COPY /conf/default.conf /etc/nginx/conf.d/default.conf



# 실행
# docker build -t nginx:test .
