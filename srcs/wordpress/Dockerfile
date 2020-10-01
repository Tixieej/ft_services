FROM alpine:latest

RUN apk update && \
	apk add vim \
			nginx \
			wget

RUN mkdir /var/run/nginx

RUN adduser -D -g 'www' www

RUN mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

# download and install Wordpress
#RUN wget https://wordpress.org/latest.tar.gz -P ./
#RUN tar xzf /latest.tar.gz --strip-components=1 -C /www/

# wsl nog een wp-config.php in je container stoppen
#COPY wp-config.php /www/

# linken met phpmyadmin of mysql container???

# configure wordpress
#RUN chmod 755 /www/wp-config.php
#RUN adduser --disabled-password -gecos "" rixt && \
#	sudo adduser rixt sudo
#RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
#RUN chown rde-vrie -R /www
#RUN sudo -u rixt -i -- wp core install --url=mysql --title="wordpress" --admin_name=rixt --admin_password=secret --admin_email=rixt@example.com --path=/www/

# Open port
EXPOSE 5050

#delete this in the end:
#CMD tail -f /dev/null
CMD ["nginx", "-g", "daemon off;"]
