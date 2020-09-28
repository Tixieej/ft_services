FROM alpine:latest

RUN apk update && \
	apk add vim && \
	apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
	apk add wget mysql mysql-client 
#	php5-mysql
#	php5-zlib

# Open port
EXPOSE 5050

#delete this in the end:
CMD tail -f /dev/null
