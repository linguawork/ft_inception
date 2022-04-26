# ft_inception

Description

This project aims to broaden knowledge of system administration with the help of Docker. 
I virtualized several Docker images, creating them in my new personal virtual machine.


• This project was done on a Virtual Machine.
• All the files required for the configuration of your project were placed in a "srcs"
folder.
• A Makefile was created and was located at the root of the directory. Makefile sets up the entire application (i.e., it builds the Docker images using
docker-compose.yml).
• The project implies reading a lot of documentation related to Docker usage and other material.


This project sets up a small infrastructure composed of different
services under specific rules. The whole project was done in a virtual machine. I used docker-compose.
Each Docker image has the same name as its corresponding service.
Each service runs in a dedicated container.
The containers are built from Debian Buster. (I may try later use Alpine)
I wrote my own Dockerfiles, one per service. The Dockerfiles are called in my docker-compose.yml by the Makefile.
I built myself the Docker images of my project. I did not pull ready-made Docker images, as well as using services such as DockerHub
(Debian is excluded from this rule).
I set up:
• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
• A Docker container that contains WordPress + php-fpm (it is installed and
configured) only without nginx.
• A Docker container that contains MariaDB only without nginx.
• A volume that contains WordPress database.
• A second volume that contains WordPress website files.
• A docker-network establishes the connection between containers.
All containers restart in case of a crash.

• In WordPress database, there are two users, one of them being the administrator. The administrator’s username is not admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and
so forth).

The volumes are available in the /home/login/data folder of the
host machine using Docker. I replaced the login
with my nickname: areggie.

I configured my domain name so it points to my local IP address.(127.0.0.1 or localhost)
This domain name is areggie.42.fr. 


The latest tag is not used.
No password is present in my Dockerfiles.
I stored environment variables in the .env file. The .env file is located at the root
of the srcs directory.
My NGINX container is the only entrypoint into my infrastructure via the port 443 only, using the TLSv1.2 or TLSv1.3 protocol.

A Dockerfile is written for each extra service. Thus, each one of them runs
inside its own container and some services may have its dedicated volume.
I set up:
• redis cache for WordPress website in order to properly manage the
cache.
• FTP server container pointing to the volume of my WordPress website.
• simple static website in HTML,  presenting my "resume sample".
• Adminer (PHP-admin like tool, but faster.)
• Container supervisor service,  which shows the metrics of every container in use.


