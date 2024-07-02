name=inception

all: build
	docker compose -f ./srcs/docker-compose.yml up -d

build:
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re: down all

clean: down
	sudo docker system prune --all

fclean: clean
	sudo rm -rf ~/data/wpdb/*
	sudo rm -rf ~/data/db/*

.PHONY: all build down re clean
