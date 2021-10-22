SHELL := /bin/bash # Use bash syntax
# Configure environment.
# ----------------------

export TZ=America/Sao_Paulo
export USER_ID=$(shell id -u)

# @TODO Hack for MacOSX or other OS which has the same group id
#       than the containers user.
export GROUP_ID=$(shell if [ `id -g` == '20' ]; then echo '1000'; else echo `id -g`; fi)

APP_CONTAINER=$(shell docker-compose ps | grep _app_run_ | cut -d" " -f 1)

build:
	docker-compose build

run:
	docker-compose run --service-ports --rm --name drupal-gql-apq app

in:
	docker exec -it drupal-gql-apq /bin/bash

stop:
	docker-compose stop

clean:
	docker-compose down
	docker ${APP_CONTAINER}
