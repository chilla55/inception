FROM alpine:3.16

RUN apk update && apk add vsftpd && rm -rf /var/cache/apk*
RUN adduser -D ftpuser
RUN addgroup ftpuser www-data
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY vsftpd.conf /etc/vsftpd.conf
COPY ./ftpstart.sh /bin/ftpstart.sh
RUN chmod +x /bin/ftpstart.sh
EXPOSE 20
EXPOSE 21
EXPOSE 11000-11100

CMD ["ftpstart.sh"]
