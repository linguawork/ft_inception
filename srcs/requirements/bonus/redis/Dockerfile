# https://www.linuxhowto.net/how-to-install-and-configure-redis-on-debian-10-linux/
#Redis is an open-source in-memory key-value data store. It can be used as a database,
#cache, and, message broker and supports various data structures such as Strings, 
#Hashes, Lists, Sets, and more. Redis provides high availability via Redis Sentinel,
#and automatic partitioning across multiple Redis nodes with Redis Cluster.

#Redis service will fail to start if IPv6 is disabled on your server.

#By default, Redis is configured to listen on localhost only. 
#You can connect to the Redis server only from the machine where 
#the Redis service is running.

#If you are using a single server setup, where the client connecting 
#to the database is also running on the same host, 
#you should not enable remote access.

#To configure Redis to accept remote connections open the Redis
#configuration file with your text editor: sudo nano /etc/redis/redis.conf
#Search for a line that begins with bind 127.0.0.1 ::1 and comment it.

#Use ss or netstat to verify that Redis is listening on all interfaces on port 6379:
#ss -an | grep 6379

FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install redis-server -y
RUN apt-get install procps -y


#copy redis config file
COPY ./redis.conf /etc

#start: redis-server + path to config file
CMD ["redis-server", "./", "--protected-mode", "no"]