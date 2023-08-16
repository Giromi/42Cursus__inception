#!/bin/sh

openssl req -x509 -nodes -days 365  \
    -newkey rsa:2048                \
    -keyout $KEYS_ -out $CERTS_     \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42/CN=$DOMAIN_NAME"

envsubst '${CERTS_} ${KEYS_}' \
        < /etc/nginx/conf.d/default.backup \
        > /etc/nginx/conf.d/default.conf

echo '>>> NGINX is starting <<<'
exec nginx -g 'daemon off;'

