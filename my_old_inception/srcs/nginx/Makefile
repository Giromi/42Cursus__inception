all:
	@make stop
	@make clean
	@make build
	@make run
	@make exec

build:
	docker build -t my_nginx:debian_bullseye .

run:
	docker run -d																		\
		--name NGINX 																	\
		-p 443:443 																		\
		-v ./conf/default.conf:/etc/nginx/conf.d/default.conf							\
		-v /etc/ssl/certs/nginx-selfsigned.crt:/etc/ssl/certs/nginx-selfsigned.crt		\
		-v /etc/ssl/private/nginx-selfsigned.key:/etc/ssl/private/nginx-selfsigned.key	\
		-v ./conf/vimrc:/root/.vimrc													\
		-v ./html/:/var/www/html/														\
		my_nginx:debian_bullseye

exec:
	 docker exec -it NGINX bash

stop:
	docker stop NGINX

clean:
	docker rm NGINX
