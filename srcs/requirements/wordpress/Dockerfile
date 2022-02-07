FROM debian:buster

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install dialog apt-utils -y && apt-get upgrade

RUN apt-get -y install php7.3 php-mysql php-fpm mariadb-client wget
EXPOSE 9000
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/wp_php.sh /var/www/

COPY ./conf/wp-config.php /var/www/
RUN chmod +x /var/www/wp_php.sh
ENTRYPOINT ["/var/www/wp_php.sh"]
