FROM alpine:3.16

RUN apk update && apk add nginx openssl php8-fpm php8-mysqli php8-opcache php8-gd php8-zlib php8-curl php8-mbstring php8-gettext \
    curl bzip2 gzip php8-session php8-bz2 php8-zip \
    && rm -rf /var/cache/apk*
    # php8
RUN mkdir /etc/nginx/certificate && chmod 700 /etc/nginx/certificate
RUN cd /etc/nginx/certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048  -keyout /etc/nginx/certificate/nginx.key -out /etc/nginx/certificate/nginx-certificate.crt \
-subj "/C=DE/ST=Niedersachsen/L=Wolfsburg/O=42/OU=42/CN=agrotzsc.42.fr/emailAddress=agrotzsc@42.fr"
COPY nginx.conf /etc/nginx/nginx.conf
COPY www.conf /etc/php8/php-fpm.d/www.conf
COPY adminer.php /var/www/html/adminer.php
COPY ./settings.sh /bin/settings.sh
RUN chmod +x /bin/settings.sh
# create test files
#RUN echo FASKJDFHKASJFHD > /var/www/html/test.html
#RUN echo "<?php phpinfo(); ?>" > /var/www/html/test.php
EXPOSE 5051
EXPOSE 9000
ENTRYPOINT ["settings.sh"]