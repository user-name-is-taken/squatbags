#! /bin/bash

export COMPOSE_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# perl -p -e 's/\$\{(\w+)\}/(exists $ENV{$1}?$ENV{$1}:"missing variable $1")/eg' $SCRIPT_DIR/compose-postgres/docker-compose.yml > outfile
cd $COMPOSE_DIR
docker compose up -d
