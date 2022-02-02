#simpleversion

#Use -f to specify name and path of one or more Compose files

#https://stackoverflow.com/questions/36884991/how-to-rebuild-docker-container-in-docker-compose-yml
#--build  используется для того чтобы контейнеры могли пересобираться после внесения изменений : --build - Build images before starting containers
# -d : Options: -d, --detach  Detached mode: Run containers in the background, print new container names. Incompatible with

# docker volume rm :  Remove one or more volumes. You cannot remove a volume that is in use by a container
# docker system prune -a --volumes :  Remove all unused images not just dangling ones (network, volumes, images, cache) shttps://docs.docker.com/engine/reference/commandline/system_prune/

# docker-compose down :  Stops containers and removes containers, networks, volumes, and images created by up. https://docs.docker.com/compose/reference/down/

#you can create folders for volumes or you can make directives in makefile to make the folders
#I created the folders myself 

#explanation of mkdir with flag -p https://pubs.opengroup.org/onlinepubs/9699919799/utilities/mkdir.html
# env variable ${HOME} is used for convenience and automation (not to type by hand home/Baatr or home/areggie), depends on computer and for portability

all:
	mkdir -p ${HOME}/data/mariadb/
	mkdir -p ${HOME}/data/wordpress/
	docker-compose -f ./srcs/docker-compose.yml up --build -d
clean:
	docker-compose -f ./srcs/docker-compose.yml down
stop:
	docker-compose -f ./srcs/docker-compose.yml stop
fclean: clean
	sudo rm -rf ${HOME}/data/mariadb/*
	sudo rm -rf ${HOME}/data/wordpress/*
	docker system prune -a --volumes 
re:	fclean all
	
