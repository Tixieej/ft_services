FROM alpine:latest

RUN apk update && \ 
	apk add nginx \
			vim

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.15.3_static_linux_amd64.tar.gz
#RUN chmod +x telegraf-1.15.3


#telegraf zit in telegraf-1.15.3/usr/bin/
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

# Open ports
EXPOSE 8088


CMD tail -f /dev/null 
