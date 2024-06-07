name=inception

all:
	bash srcs/requirements/tools/dir.sh
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	bash srcs/requirements/tools/dir.sh
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re:


clean: down
	docker system prune --all 
	sudo rm -rf ~/data/wpdb
	sudo rm -rf ~/data/db

fclean:

