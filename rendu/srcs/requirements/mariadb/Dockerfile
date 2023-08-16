FROM debian:bullseye

RUN apt update -y && apt upgrade -y         \
    && apt-get install mariadb-server -y    \
    && apt-get install vim -y

# 디렉터리 위치  나중에  다시  확인해보기
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/mariadb_script.sh /

ENTRYPOINT [ "/mariadb_script.sh" ]

EXPOSE 3306
