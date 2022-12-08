FROM alpine:3.16
RUN apk update && apk add nano nmap redis && rm -rf /var/cache/apk*
RUN echo "maxmemory 256mb" >> /etc/redis.conf
RUN echo "maxmemory-policy allkeys-lfu" >> /etc/redis.conf
RUN sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis.conf
RUN sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf

EXPOSE 6379

ENTRYPOINT [ "redis-server", "/etc/redis.conf" ]