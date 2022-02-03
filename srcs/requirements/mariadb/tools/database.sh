#!/usr/bin/env bash

#sed -i "s/bind-ad/\#bind-ad/" "/etc/mysql/mariadb.conf.d/50-server.cnf"
#sed -i "s/\#port /port   /" "/etc/mysql/mariadb.conf.d/50-server.cnf"
#даем права на пользование папкой юзеру mysql (он указан в конфиге 50-server)
chown -R mysql:mysql /var/lib/mysql
echo "Making database..."
#if my Database does not exist I make it with via bash script
if [ ! -d var/lib/mysql/FalconGroupDB ]; then
echo "Inside IF"
service mysql start

mkdir -p /var/run/mysqld
touch /var/run/mysqld/mysqlf.pid
mkfifo /var/run/mysqld/mysqlf.sock

mysql -u root -e "create database if not exists $MYSQL_DATA_BASE;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
mysql -u root -e "grant all privileges on $MYSQL_DATA_BASE.* to '$MYSQL_USER'@'%';"
mysql -u root -e "flush privileges"

mysqladmin -u root password $MYSQL_ROOT_PASS;
service mysql stop
else
echo "Inside ELSE"
mkdir /var/run/mysqld
touch /var/run/mysqld/mysqlf.pid
mkfifo /var/run/mysqld/mysqlf.sock
fi

chown -R mysql /var/run/mysqld

exec "$@"
#exec /usr/bin/mysqld_safe
#exec mysqld


