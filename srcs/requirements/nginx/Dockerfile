FROM alpine:3.16

RUN apk update && apk add nginx openssl && rm -rf /var/cache/apk*
RUN mkdir /etc/nginx/certificate && chmod 700 /etc/nginx/certificate
RUN cd /etc/nginx/certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048  -keyout /etc/nginx/certificate/nginx.key -out /etc/nginx/certificate/nginx-certificate.crt \
-subj "/C=DE/ST=Niedersachsen/L=Wolfsburg/O=42/OU=42/CN=agrotzsc.42.fr/emailAddress=agrotzsc@42.fr"
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
