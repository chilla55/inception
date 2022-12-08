NAME = inception

$(NAME): all

all: setdomain
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/db
	docker compose --project-directory ./srcs up --build -d
	
stop:
	docker compose --project-directory ./srcs down

restart: stop all

fclean:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q)
	-sudo rm -rf ~/data

rmdata:
	sudo rm -rf ~/data

re: fclean all

setdomain:
	cat /etc/hosts | grep localhost
	sudo sh -c 'echo "127.0.0.1 agrotzsc.42.fr" >> /etc/hosts'
