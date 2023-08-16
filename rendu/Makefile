# 변수 선언
MAKE	:=	make -i
DB_DIR	:=	/home/minsuki2/data/DB
WP_DIR	:=	/home/minsuki2/data/WordPress
SHELL	:=	/bin/bash

.PHONY: all build up up_d down start stop re			\
		rm rmi rmv rmd rmn								\
		exec_n exec_w exec_m							\
		stop_all rm_all rmi_all rmv_all fclean			\
		logs_n logs_w logs_m 							\
		ls data 

all :
	${MAKE} build
	${MAKE} up

build :
	@docker compose -f ./srcs/docker-compose.yml build

up :
	@docker compose -f ./srcs/docker-compose.yml up

up_d :
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

down_rmi :
	@docker compose -f ./srcs/docker-compose.yml down --rmi local

down_rmv :
	@docker compose -f ./srcs/docker-compose.yml down --volumes

rmd :
	@echo ">>>Data 삭제<<<"
	@echo -n "mariadb > "
	sudo rm -rf ${DB_DIR}/*
	@echo -n "wordpress > "
	sudo rm -rf ${WP_DIR}/*

rmn :
	@echo ">>>network 삭제<<<"
	docker network rm my_network

exec_n :
	@docker exec -it my_nginx /bin/bash

exec_w :
	@docker exec -it my_wordpress /bin/bash
 
exec_m :
	@docker exec -it my_mariadb /bin/bash

stop_a : 
	docker stop -f `docker ps -aq`

all_rm :
	docker rm -f `docker ps -aq`

all_rmi :
	docker rmi -f `docker images -aq`

all_rmv :
	docker volume rm `docker volume ls -q`

fclean:
	${MAKE} down_rmi
	${MAKE} down_rmv
	${MAKE} rmd

ls:
	@echo -e "\n>>> Compose <<<"
	@docker compose ls
	@echo -e "\n>>>> Container <<<"
	@docker ps -a
	@echo -e "\n>>>> Images <<<"
	@docker images
	@echo -e "\n>>>> Volumes <<<"
	@docker volume ls
	@echo -e "\n>>>> Networks <<<"
	@docker network ls

dls:
	@echo -e '\n>>> Data <<<'
	@ls -al ${DB_DIR} ${WP_DIR}

logs_n:
	docker logs my_nginx

logs_w:
	docker logs my_wordpress

logs_m:
	docker logs my_mariadb

re:
	${MAKE} fclean
	${MAKE} all

