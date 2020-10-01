#!/bin/sh

if ! [[ -d "$HOME/docker/volumes/postgres" ]]; then
	echo " create folder for pg data file:"
	echo " $HOME/docker/volumes/postgres"
	mkdir -p $HOME/docker/volumes/postgres
fi


postgres_available="$(docker images | grep postgres)"
if [[ $postgres_available == "" ]]; then

	echo " pull postgres 12.3"
	docker pull postgres:12.3
else
	echo " run postgres"
	docker run --rm -it  \
		--name pg-docker \
		-e POSTGRES_PASSWORD=docker \
		-d -p 5432:5432 \
		-v $HOME/docker/volumes/postgres:/var/lib/postgresql/data\
		postgres:12.3
fi
