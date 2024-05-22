DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

.PHONY: build up down 

build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down