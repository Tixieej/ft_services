FROM alpine:latest

RUN apk update && \
	apk add vim && \
	apk add lighttpd php7-common \
	php7-iconv php7-json \
	php7-gd php7-curl \
	php7-xml \
	php7-imap php7-cgi fcgi \
	php7-pdo \
	php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt \
	php7-gettext php7-ldap \
	php7-ctype php7-dom
#	php5-mysql
#	php5-zlib
#	php7-mysqli
#	php7-pdo_mysql
CMD tail -f /dev/null
