.PHONY: all build up down start stop down-volumes erase re

MAKE = make -i

all :
	make build
	make up

build :
	@docker compose -f ./srcs/docker-compose.yml build

up :
	@docker compose -f ./srcs/docker-compose.yml up -d

# @docker compose -f ./srcs/docker-compose.yml down --volumes

start :
	@docker compose -f ./srcs/docker-compose.yml start




stop :
	@docker compose -f ./srcs/docker-compose.yml stop

rm :
	@docker compose -f ./srcs/docker-compose.yml rm

down :
	@docker compose -f ./srcs/docker-compose.yml down

rmi :
	@docker compose -f ./srcs/docker-compose.yml down --rmi local

rmv :
	@docker compose -f ./srcs/docker-compose.yml down --volumes

rmd :
	@echo ">>>Data 삭제<<<"
	@echo -n "mariadb > "
	sudo rm -rf /goinfre/minsuki2/inception_data/mariadb/* 
	@echo -n "wordpress > "
	sudo rm -rf /goinfre/minsuki2/inception_data/wordpress/* 
	@make data


exec_n:
	@docker exec -it my_nginx /bin/bash

exec_w:
	@docker exec -it my_wordpress /bin/bash

exec_m:
	@docker exec -it my_mariadb /bin/bash

stop_all : 
	docker stop -f `docker ps -aq`

rm_all :
	docker rm -f `docker ps -aq`




rmi_all :
	docker rmi -f `docker images -aq`

rmv_all :
	docker volume rm `docker volume ls -q`



fclean:
	${MAKE} down
	${MAKE} rmi
	${MAKE} rmv
	${MAKE} rmd

ls:
	@echo container
	@docker ps -a
	@echo
	@echo images
	@docker images
	@echo
	@echo volumes
	@docker volume ls

data:
	@echo -e '\n>>>Data 확인<<<'
	@ls -al /goinfre/minsuki2/inception_data/wordpress/ /goinfre/minsuki2/inception_data/mariadb/

logs_n:
	docker logs my_nginx

logs_w:
	docker logs my_wordpress

logs_m:
	docker logs my_mariadb

re:
	make fclean
	make all

