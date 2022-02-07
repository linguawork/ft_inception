FROM debian:buster

RUN apt-get update &&\
	apt-get upgrade -y 

#install nginx and make dir for pid
RUN apt-get -y install nginx && mkdir -p /run/nginx

#copy config file for nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

#make dir for site and copy index file
RUN mkdir -p /var/www/site/
COPY index.html /var/www/site/

#copy ssl key and certs for nginx
#copy ssl cert and key
RUN mkdir -p /etc/ssl/certs
RUN mkdir -p /etc/ssl/private

RUN chown -R root:root /etc/ssl/certs
RUN chown -R root:root /etc/ssl/private

RUN chmod -R 600 /etc/ssl/certs
RUN chmod -R 600 /etc/ssl/private

COPY nginx.key /etc/ssl/private
COPY nginx.crt /etc/ssl/certs

#start nginx
CMD nginx -g "daemon off;"