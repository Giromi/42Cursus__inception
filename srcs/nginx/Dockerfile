
# https://www.debian.org/releases/

FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y     \
	&& apt-get install nginx -y                 \
	&& apt-get install openssl -y               \
    && apt-get install vim -y                       

COPY /conf/default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443
