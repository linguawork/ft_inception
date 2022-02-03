# https://ru.wikipedia.org/wiki/Adminer
#Adminer (бывший phpMinAdmin) — это легковесный инструмент администрирования MySQL,
#PostgreSQL, SQLite, MS SQL и Oracle. 
#Проект родился как «облегчённый» вариант phpMyAdmin.

FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install wget -y

RUN apt-get install procps -y

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php &&\
	mv adminer-4.8.1.php adminer.php

#command to copy into wordpress for execution in wordpress
CMD cp /adminer.php /var/www/wordpress 