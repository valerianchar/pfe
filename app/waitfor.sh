#!/bin/bash

wait_for_service(){
  until php artisan command:checkdatabasestate "$@" > /dev/null; do
    >&2 echo "Postgres is unavailable - sleeping"
    sleep 2
  done
  >&2 echo "Database is up !"
}

# Wait MYSQL
wait_for_service "$@"
