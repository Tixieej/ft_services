FROM alpine:latest
 
RUN apk update && \
	apk add vim \
			influxdb \
			wget \
			curl


#RUN service influxdb start

# unpack influxdb
#RUN tar xvfz influxdb_client_2.0.0-rc.0_linux_amd64.tar.gz
#RUN cp influxdb_client_2.0.0-rc.0_linux_amd64/influx /usr/local/bin/

#COPY init.sql /init.sql
#COPY my.cnf /etc/my.cnf
#COPY startup.sh /startup.sh
#RUN chmod +x startup.sh

# expose default port 8086
EXPOSE 8086

#CMD ./startup.sh
CMD tail -f /dev/null
