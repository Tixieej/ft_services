FROM alpine:latest

RUN apk update && \ 
	apk add nginx \
			openssl \
			vim \
			openssh

RUN mkdir /var/run/nginx

# Create new user
RUN adduser -D -g 'www' www

# Configure SSH
#RUN ssh-keygen -A
#RUN /usr/sbin/sshd
#RUN adduser -h / -D rixt
#RUN echo "rixt:secret" | chpasswd

# Create a directory
RUN mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

# Open ports
EXPOSE 80 443 22

RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=NL/ST=Noord-Holland/O=Codam/CN=localhost.com" -newkey rsa:2048 -keyout \
	/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
COPY sshd_config /etc/ssh/sshd_config
COPY startup.sh ./

RUN chmod +x startup.sh

CMD ./startup.sh
#CMD ["nginx", "-g", "daemon off;"]

#Place this file in the same directory as your directory of content ("static-html-directory"), run docker build -t some-content-nginx ., then start your container:
#$ docker run --name some-nginx -d some-content-nginx
#$ docker run --name some-nginx -d -p 8080:80 some-content-nginx
#Then you can hit http://localhost:8080 or http://host-ip:8080 in your browser.
