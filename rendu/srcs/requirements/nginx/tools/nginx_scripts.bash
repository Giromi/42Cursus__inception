#!/bin/bash
#
#

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY_ -out $CERTS_ -subj "/C=KR/ST=Seoul/L=Seoul/O=42/CN=$DOMAIN_NAME"

# envsubst < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf
#
nginx -v
echo '>>> NGINX is starting <<<'
nginx -g 'daemon off;'
