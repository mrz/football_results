#!/usr/bin/env sh

# run container
docker container run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -v football-server-pgsql:/var/lib/postgresql/data --rm postgres:11-alpine

# start psql
#docker container exec -it postgres psql -U postgres
