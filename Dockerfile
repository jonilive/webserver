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
    php85-calendar \
    php85-cli \
    php85-common \
    php85-ctype \
    php85-curl \
    php85-dev \
    php85-dom \
    php85-exif \
    php85-ffi \
    php85-fileinfo \
    php85-ftp \
    php85-gd \
    php85-gettext \
    php85-iconv \
    php85-imap \
    php85-intl \
    php85-mbstring \
    php85-mysqli \
    php85-odbc \
    php85-pcntl \
    php85-pdo \
    php85-pdo_mysql \
    php85-pdo_sqlite \
    php85-pear \
    php85-pecl-igbinary \
    php85-pecl-imagick \
    php85-phar \
    php85-posix \
    php85-redis \
    php85-shmop \
    php85-simplexml \
    php85-soap \
    php85-sodium \
    php85-sqlite3 \
    php85-sysvmsg \
    php85-sysvsem \
    php85-sysvshm \
    php85-tokenizer \
    php85-xml \
    php85-xmlreader \
    php85-xmlwriter \
    php85-xsl \
    php85-zip \
    py3-pip \
    python3 && \
    rm -rf /var/cache/apk/*

COPY init.sh /init.sh
RUN chmod +x /init.sh

CMD ["/bin/sh", "/init.sh"]
