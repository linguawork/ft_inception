FROM debian:buster

COPY ./tools/init.sh ./

RUN apt-get update &&\
	apt-get upgrade -y &&\
	apt-get -y install vsftpd ftp

COPY ./conf/vsftpd.conf /etc

CMD bash /init.sh