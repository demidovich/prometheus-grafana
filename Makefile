.DEFAULT_GOAL := help

include .env
export $(shell sed 's/=.*//' .env)

#APP_NAME=yz-lum
#APP_PORT=8080
#export APP_NAME
#export APP_PORT

ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Up docker compose
	@mkdir -p var/prometheus
	@mkdir -p var/grafana
	docker-compose -f docker-compose.yml up -d --force-recreate --build

down: ## Down docker compose
	docker-compose -f docker-compose.yml down

prometheus-shell: ## Shell of prometheus container
	@docker-compose -f docker-compose.yml exec prometheus /bin/sh

ps: ## Status of containers
	@docker-compose -f docker-compose.yml ps

log: ## Container output logs
	@docker-compose -f docker-compose.yml logs --follow --tail 1

default: help

