#!/bin/sh

docker run --rm -it  \
	--name pg-docker \
	-e POSTGRES_PASSWORD=docker \
	-d -p 5432:5432 \
	-v $HOME/work/volumes/postgres:/var/lib/postgresql/data\
	-v $HOME/work/mission_generation/test_docker:/var/lib/postgresql/ postgres

# sudo docker exec -it pg-docker psql -U postgres -a postgres

# psql -h hostname -d databasename -U username -f {SQL script file name}
# psql -h localhost -d postgres -U postgres -f backup.sql
# psql -h localhost -U postgres -W

# docker exec -it pg-docker pg_dump -U postgres -p 5432 -d postgres -W -f /var/lib/postgresql/data/backup.sql
# docker exec -it pg-docker psql -U postgres -p 5432 -d postgres -W -f /var/lib/postgresql/data/backup.sql
