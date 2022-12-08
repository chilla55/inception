FROM alpine:3.16

RUN apk update && apk add bash mariadb-client php8-fpm php8-mysqli php8-phar php8-opcache php8-gd \
	php8-zlib php8-curl php8-mbstring php8-gettext curl bzip2 gzip php8-session php8-bz2 \
	php8-mysqlnd php8-pgsql php8-pdo_pgsql php8-sqlite3 php8-pdo_sqlite php8-zip php8-pecl-redis \
	php-json php-common php-session php-iconv php-curl php-xml php-imap php-cgi fcgi php-pdo \
	php-pdo_mysql php-soap php-posix php-ldap php-ctype php-dom php-simplexml php-tokenizer \
    && rm -rf /var/cache/apk*
RUN adduser -S nginx && addgroup -S nginx && adduser nginx nginx
COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools/settings.sh /bin/settings.sh
RUN chmod +x /bin/settings.sh
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

EXPOSE 9000

ENTRYPOINT ["settings.sh"]