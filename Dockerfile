FROM alpine:latest

RUN mkdir -p /run/apache2
RUN mkdir -p /var/log
RUN mkdir -p /www
VOLUME /var/log
VOLUME /www

EXPOSE 80

RUN apk add --no-cache \
	git \
    apache2 \
    php85 \
	php85-common \
	php85-pear \
	php85-cli \
	php85-curl \
    php85-dev \
	php85-gd \
    php85-imap \
	php85-intl \
	php85-mbstring \
	php85-redis \
    php85-soap \
	php85-sqlite3 \
	php85-xml \
    php85-zip \
    php85-apache2 \
    php85-mysqli \
	php85-pecl-imagick \
    htop python3 py3-pip \
	openjdk8 \
	nodejs npm \
	supervisor 

COPY init.sh /init.sh
RUN chmod +x /init.sh

CMD ["/bin/sh", "/init.sh"]