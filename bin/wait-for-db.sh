#!/bin/sh

while ! nc -z 127.0.0.1 ${LOCAL_DATABASE_PORT}; do
  echo >&2 "$(date +%T) Postgres is unavailable - sleeping"
  sleep 1
done

echo >&2 "$(date +%T) Postgres is up"
