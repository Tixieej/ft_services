FROM alpine:latest

RUN apk update && \
	apk add vim \
			wget \
			curl \
			libc6-compat
		#	grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# download and unpack grafana
RUN wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.2.0.linux-amd64.tar.gz
#voor opstarten in container: ./bin/grafana-server


# copy necessary files to container
COPY startup.sh ./
COPY ./grafana.db ./grafana-7.2.0/data/grafana.db

# make files executable
RUN chmod +x startup.sh

# Open port
EXPOSE 3000

#delete this in the end:
#CMD tail -f /dev/null
CMD ./startup.sh
