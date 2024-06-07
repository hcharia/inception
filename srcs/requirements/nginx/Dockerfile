FROM alpine:3.20.0

RUN apk update && apk upgrade

RUN apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/hcharia.42.fr.key \
	-out /etc/nginx/ssl/hcharia.42.fr.crt \
	-subj "/CN=hcharia.42.fr"

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/http.d/

CMD [ "nginx", "-g", "daemon off;" ]