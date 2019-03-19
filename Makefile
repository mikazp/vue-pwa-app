# Makefile for docker env

DEV_UID=`id -u`
APP_SERVICE=node
env=dev
compose=docker-compose

ifeq (prod, $(env))
	compose=docker-compose -f docker-compose.prod.yml
endif

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  start              Start   docker containers"
	@echo "  restart            Restart docker containers"
	@echo "  build              Build docker containers"
	@echo "  recreate           Recreate docker containers"
	@echo "  bash               Php container console"
	@echo "  root               Php container console with root user"

start:
	@$(compose) up -d

build:
ifeq (prod, $(env))
	@docker-compose run --user=$(DEV_UID) --entrypoint='' --rm $(APP_SERVICE) npm run build
	@$(compose) build
else
	@$(compose) build
endif

install:
	@$(compose) run --user=$(DEV_UID) --entrypoint='' --rm $(APP_SERVICE) npm install

restart:
	@$(compose) stop
	@$(compose) up -d

bash:
	@$(compose) exec $(APP_SERVICE) ash

root:
	@$(compose) exec $(APP_SERVICE) --user root ash

pull:
	@$(compose) pull

push:
	@$(compose) push

test:
	@$(compose) run --user=$(DEV_UID) --entrypoint='' --rm $(APP_SERVICE) npm run test:unit