#!/bin/sh
cd "$(dirname "$0")"
docker compose exec -w /etc/caddy caddy caddy fmt --overwrite
docker compose exec -w /etc/caddy caddy caddy reload
