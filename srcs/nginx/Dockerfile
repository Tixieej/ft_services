FROM alpine

MAINTAINER rde-vrie

RUN apt-get update && apt-get install -y \
	nginx

#COPY ./nginx/html /usr/share/nginx/html
# de mappen heten vast anders


#Place this file in the same directory as your directory of content ("static-html-directory"), run docker build -t some-content-nginx ., then start your container:
#$ docker run --name some-nginx -d some-content-nginx
#$ docker run --name some-nginx -d -p 8080:80 some-content-nginx
#Then you can hit http://localhost:8080 or http://host-ip:8080 in your browser.
