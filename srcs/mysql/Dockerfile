FROM alpine
 
MAINTAINER rde-vrie

RUN apt-get update && apt-get install -y \
	default-mysql-server \
	php7.3 \
	php7.3-fpm \
	php-mysql \
	php-json \
	php-cli \
	php-zip \
	php-cgi \
	php-pear \
	php-mbstring \
	php-gd \
	php-imagick \
	wget

#Install phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz -O - | tar -xz
RUN mv phpMyAdmin-5.0.2-english /var/www/html/phpmyadmin
RUN mkdir /var/www/html/phpmyadmin/tmp
RUN chmod 755 /var/www/html/phpmyadmin/tmp

#Wordpress
RUN wget https://wordpress.org/latest.tar.gz -P /tmp
RUN tar xzf /tmp/latest.tar.gz --strip-components=1 -C /var/www/html

COPY ./wp-config.php /var/www/html/

#Configure the database.
RUN service mysql start && \
	mysql -e "UPDATE mysql.user SET Password=PASSWORD('hello') WHERE User='root'" && \
	mysql -e "DELETE FROM mysql.user WHERE User=''" && \
	mysql -e "DELETE FROM mysql.user WHERE User-'root' AND Host NOT IN \
				('localhost', '127.0.0.1', '::1')" && \
	mysql -e "FLUSH PRIVILEGES"

#Make a new user for phpMyAdmin, and create mysql database.
RUN service mysql start && \
	mysql -e "CREATE USER 'rde-vrie'@'localhost' IDENTIFIED BY 'hello'" && \
	mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'rde-vrie'@'localhost' IDENTIFIED BY 'hello';" && \
	mysql -e "FLUSH PRIVILEGES" && \
	mysql -e "CREATE DATABASE phpmyadmin" && \
	mysql phpmyadmin < /var/www/html/phpmyadmin/sql/create_tables.sql && \
	mysql -e "CREATE DATABASE wordpress"

#bovenstaand is letterlijk gekopieerd uit dockerfile van ft_server, dus het klopt vast niet helemaal.....
