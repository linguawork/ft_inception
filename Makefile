#sudo docker rmi -f $(sudo docker images -qa)
#sudo docker volume rm $(sudo docker volume ls -q)
#sudo docker system prune -a --force

#simpleversion

#Use -f to specify name and path of one or more Compose files

# you can create folders for volumes or you can make directives in makefile to make the folders
#I wrote the folders myself

#-qa 

all:
	docker-compose -f ./srcs/docker-compose.yml up
clean:
	docker-compose -f ./srcs/docker-compose.yml down
fclean: clean
	docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volume ls -q);
	docker network rm $$(docker networl -ls -q);

#why $$ signs?