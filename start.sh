#!/bin/sh
STOP_SERVICES="stablediff-cuda text-generation-webui tts"
START_SERVICES="$STOP_SERVICES caddy authproxy tor grafana prometheus speedtest"

do_cleanup() {
  docker compose exec stablediff-cuda sh -c 'rm -rf /tmp/* /stablediff-web/log/images /stablediff-web/outputs/*'
}

cd "$(dirname "$0")"
export MY_UID="$(id -u)"
export MY_GID="$(id -g)"
case "$1" in
  stop)
    do_cleanup
    docker compose stop -t 0 $STOP_SERVICES
    ;;

  start)
    docker compose start
    do_cleanup
    echo '{}' > static/timeout.json
    ;;

  restart)
    docker compose restart stablediff-cuda -t 0
    ;;

  cleanup)
    do_cleanup
    ;;

  *)
    echo "Specify operation"
    ;;
esac
