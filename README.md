
<div align="center"><img width="256" height="256" alt="logo" src="https://github.com/user-attachments/assets/f4ee7bbf-6641-4eb3-a848-ce7d113fd95d" /></div>

# Web Server Docker Setup

A lightweight, configurable web server container based on Alpine Linux, featuring Apache, PHP 8.5, and cron support for scheduled tasks.

## Features

- **Apache 2.4** web server with PHP 8.5 integration
- **PHP 8.5** with extensive extensions (GD, MySQLi, Redis, SOAP, XML, ZIP, etc.)
- **Cron daemon** for scheduled tasks
- **Configurable** via mounted volumes - edit configs without rebuilding
- **Development tools** included: Git, Python 3, Node.js, npm, htop
- **Lightweight** Alpine Linux base

## Prerequisites

- Docker and Docker Compose installed on your system

## Quick Start

1. Clone or download this repository
2. Place your web application files in `appdata/www/`
3. Run the container:

```bash
docker-compose up -d
```

4. Access your site at `http://localhost`

## Configuration

The container is designed to be highly configurable through mounted volumes. All configuration files are created automatically on first run with sensible defaults.

### Web Server Configuration

Edit `appdata/config/httpd.conf` to customize Apache settings. The file is copied to `/etc/apache2/httpd.conf` on container startup.

### PHP Configuration

Edit `appdata/config/php.ini` to customize PHP settings. The file is copied to `/etc/php85/php.ini` on container startup.

### Cron Jobs

Edit `appdata/config/crontab` to add scheduled tasks. Uses system crontab format with user field. Jobs run as the `apache` user for consistency with web application permissions.

Example crontab entries:
```
# Run Laravel scheduler daily at 2 AM
0 2 * * * apache php /www/artisan schedule:run

# Run queue worker every minute
* * * * * apache php /www/artisan queue:work --sleep=3 --tries=3

# Custom PHP script every 5 minutes
*/5 * * * * apache php /www/custom-script.php
```

## Directory Structure

```
webserver/
├── docker-compose.yml    # Docker Compose configuration
├── Dockerfile           # Container build instructions
├── init.sh             # Container initialization script
├── LICENSE             # MIT License
├── appdata/
│   ├── config/         # Configuration files (httpd.conf, php.ini, crontab)
│   ├── log/            # Apache logs
│   └── www/            # Web application files
```

## Usage

### Starting the Container

```bash
docker-compose up -d
```

### Stopping the Container

```bash
docker-compose down
```

### Viewing Logs

```bash
docker-compose logs -f webserver
```

### Rebuilding After Configuration Changes

```bash
docker-compose up -d --build
```

### Accessing the Container

```bash
docker exec -it webserver /bin/sh
```

## PHP Extensions Included

- php85-common, php85-cli, php85-curl, php85-dev, php85-gd, php85-imap
- php85-intl, php85-mbstring, php85-redis, php85-soap, php85-sqlite3
- php85-xml, php85-zip, php85-apache2, php85-mysqli, php85-pecl-imagick

## Security Notes

- Cron jobs run as the `apache` user, not root
- Apache runs as `apache:apache` user/group
- Container follows principle of least privilege

## Troubleshooting

- **Permission issues**: Ensure files in `appdata/www/` are readable by the `apache` user
- **Cron not working**: Check `/var/log/cron.log` inside the container
- **PHP errors**: Check Apache error logs in `appdata/log/apache2/error.log`

## License

MIT License - see LICENSE file for details.

Copyright (c) 2026 João "Jonilive" Rodrigues
