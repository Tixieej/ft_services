FROM alpine:latest

RUN apk update && \
	apk add vim && \
	apk add lighttpd \
	php7-json \
	php7 \
	php7-fpm \
	php7-session \
	php7-json \
	php7-mysqli \
	php7-mbstring
#install phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz -O - | tar -xz
RUN mv phpMyAdmin-5.0.2-english /var/www/phpmyadmin
RUN mkdir /var/www/phpmyadmin/tmp
RUN chmod 755 /var/www/phpmyadmin/tmp

COPY config.inc.php /var/www/phpmyadmin/config.inc.php

# startup script
COPY phpmyadmin.sh /phpmyadmin.sh
RUN chmod +x /phpmyadmin.sh
CMD ./phpmyadmin.sh

#CMD tail -f /dev/null
