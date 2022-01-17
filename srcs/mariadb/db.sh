#!bin/env bash
chown -R mysql:mysql /var/lib/mysql
if ! [ -d "var/lib/mysql/wp" ]; then
service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS FalconGroupDB DEFAULT CHARACTER SET utf8;"
mysql -u root -e "CREATE USER 'areggie'@'%' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON FalconGroupDB.* TO 'areggie'@'%'"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password '12345'
service mysql stop
fi

/usr/bin/mysqld_safe
