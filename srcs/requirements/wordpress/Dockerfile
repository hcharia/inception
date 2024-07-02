FROM alpine:3.20.0

RUN apk update && apk upgrade

RUN apk add php \
	php-fpm \
	php-mysqli \
	php-phar \
	php-iconv

COPY ./requirements/wordpress/conf/www.conf /etc/php83/php-fpm.d/www.conf

WORKDIR /var/www/

RUN wget https://wordpress.org/latest.zip && unzip latest.zip && cp -rf wordpress/* . && rm -rf latest.zip wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/conf/conf.sh ./conf.sh

RUN chmod +x ./conf.sh

ENTRYPOINT [ "sh", "./conf.sh" ]

CMD [ "php-fpm83", "-F" ]