FROM debian:buster
RUN apt-get update && apt-get install dialog apt-utils -y && apt-get upgrade
RUN apt-get install mariadb-server -y procps
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 444 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306
COPY ./tools/database.sh /var/www/
RUN chmod +x /var/www/database.sh
ENTRYPOINT ["/var/www/database.sh"]
CMD ["mysqld"]

#COPY ./createdb.sql /
#RUN chmod 755 /createdb.sql
#RUN service mysql start && mysql < createdb.sql 
#RUN rm -f createdb.sql
#CMD ["/usr/bin/mysqld_safe"]
