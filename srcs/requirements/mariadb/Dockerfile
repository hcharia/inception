FROM alpine:3.20.0

RUN apk update && apk upgrade

RUN apk add mariadb mariadb-client


COPY ./requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN mkdir -p /var/lib/mysql/ && chmod -R 755 /var/lib/mysql/ && chown -R mysql:mysql /var/lib/mysql && mkdir -p /run/mysqld/ && chown -R mysql:mysql /run/mysqld/

COPY ./requirements/mariadb/conf/init.sh /init.sh

RUN chmod +x init.sh


ENTRYPOINT [ "sh", "init.sh" ]

CMD [ "mysqld", "--user=mysql", "--console" ]