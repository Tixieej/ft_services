# We need to build from Alpine Linux.
FROM alpine:latest

# Update the apk package manager and install all necessary packages.
RUN apk update && \
    apk add php7 php7-fpm php7-mbstring php7-json php7-session php7-mysqli && \
    apk add nginx \
	apk add vim

# Download and unpack PHPMyAdmin.
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
    mkdir www && \
    tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www

# Create a folder for the nginx.pid file, and add a 'www' user for nginx.
RUN mkdir /var/run/nginx && \
    mkdir /www/tmp && \
    adduser -D -g 'www' www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    chown -R www:www /www/tmp

# Copy the nginx configuration.
COPY nginx.conf /etc/nginx/nginx.conf

# Copy PHPMyAdmin config file.
COPY config.inc.php /www/config.inc.php

# Copy the startup script.
COPY phpmyadmin.sh /phpmyadmin.sh

# Give the startup script permissions to execute.
RUN chmod +x /phpmyadmin.sh

# Expose port 5000.
EXPOSE 5000

# Keep the container running.
CMD ./phpmyadmin.sh

