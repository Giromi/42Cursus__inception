all:
	@make stop
	@make clean
	@make build
	@make run
	@make exec

build:
	docker build -t my_wordpress:debian_bullseye .

run:
	docker run -it -d 																	\
		--name WordPress_PHP															\
		-v ./conf/vimrc:/root/.vimrc													\
		my_wordpress:debian_bullseye bash

exec:
	docker exec -it WordPress_PHP bash

stop:
	docker stop WordPress_PHP

clean:
	docker rm WordPress_PHP

.PHONY: all build run exec stop clean
