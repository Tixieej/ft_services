FROM alpine:latest

RUN apk update && \
	apk add vim \
			wget \
			curl \
			grafana 
#--repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# copy necessary files to container
#COPY startup.sh ./

# make files executable
#RUN chmod +x startup.sh

# Open port
EXPOSE 3000

#delete this in the end:
CMD tail -f /dev/null
#CMD ./startup.sh
