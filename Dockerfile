FROM alpine:latest

RUN mkdir -p /run/apache2 /var/log /www

VOLUME /var/log /www
EXPOSE 80

RUN apk add --no-cache \
    apache2 \
    curl \
    dcron \
    git \
    htop \
    nodejs \
    npm \
    openjdk8 \
    php85 \
    php85-apache2 \
    php85-cli \
    php85-common \
    php85-curl \
    php85-dev \
    php85-gd \
    php85-imap \
    php85-intl \
    php85-mbstring \
    php85-mysqli \
    php85-pear \
    php85-pecl-imagick \
    php85-redis \
    php85-soap \
    php85-sqlite3 \
    php85-xml \
    php85-zip \
    py3-pip \
    python3 && \
    rm -rf /var/cache/apk/*

COPY init.sh /init.sh
RUN chmod +x /init.sh

CMD ["/bin/sh", "/init.sh"]
