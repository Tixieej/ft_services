FROM alpine:latest

RUN apk update && \ 
	apk add nginx \
			vim

# Download and unpack telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.15.3_static_linux_amd64.tar.gz
#RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
#RUN tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz


# Copy files into container
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/
#COPY ./telegraf.conf /telegraf/
COPY startup.sh .
RUN chmod +x startup.sh

# Open port
EXPOSE 8125

CMD ./startup.sh
#CMD tail -f /dev/null 
