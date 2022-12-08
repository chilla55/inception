FROM alpine:3.16

RUN apk update && apk add mariadb mariadb-client && rm -rf /var/cache/apk*

COPY ./tools/db_setup.sh /tmp/db_setup.sh
COPY ./tools/sec_install.sql /tmp/sec_install.sql
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/db_setup.sh"]
