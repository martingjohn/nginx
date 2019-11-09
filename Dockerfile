FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
            software-properties-common \
    && add-apt-repository -y ppa:nginx/stable \
    && apt-get update \
    && apt-get install -y \
            nginx-extras \
            ssl-cert \
    && rm -rf /var/lib/apt/lists/* 

VOLUME /home/nginx/cache

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD 'nginx -g "daemon off;"'
