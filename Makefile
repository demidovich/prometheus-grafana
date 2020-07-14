.DEFAULT_GOAL := help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Up docker compose
	@docker-compose -f docker-compose.yml up -d --force-recreate --build

down: ## Down docker compose
	@docker-compose -f docker-compose.yml down

prometheus: ## Shell of prometheus container
	@docker-compose -f docker-compose.yml exec prometheus /bin/sh

grafana: ## Shell of prometheus container
	@docker-compose -f docker-compose.yml exec grafana /bin/sh

ps: ## Status of containers
	@docker-compose -f docker-compose.yml ps

log: ## Container output logs
	@docker-compose -f docker-compose.yml logs --follow --tail 1

default: help
