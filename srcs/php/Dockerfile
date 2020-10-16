FROM alpine:latest

RUN apk update && \
	apk add vim && \
	#apk add lighttpd \
	php7-json \
	php7 \
	php7-fpm \
	php7-session \
	php7-mysqli \
	php7-mbstring \
	nginx
	
# install phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz -O - | tar -xz
RUN mv phpMyAdmin-5.0.2-english /www/phpmyadmin
RUN mkdir /www/phpmyadmin/tmp
RUN chmod 755 /www/phpmyadmin/tmp

COPY config.inc.php /var/www/phpmyadmin/config.inc.php

# configure Nginx
RUN adduser -D -g 'www' www
RUN mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	chown -R www:www /www/tmp
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 5000
EXPOSE 5000

# Startup script
COPY phpmyadmin.sh /phpmyadmin.sh
RUN chmod +x /phpmyadmin.sh
CMD ./phpmyadmin.sh

#CMD tail -f /dev/null
