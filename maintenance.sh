#!/bin/sh
if [ "$1" = "enable" ]
then
  sed -i -e 's/import sd # maintenance/respond "Maintenance mode, please come back later."/' Caddyfile
  sed -i -e 's@\(^[^#].*freeze-settings.*\)@#\1@' -e 's@^#\(.*enable-insecure-extension-access.*\)@\1@' -e 's@\(^export TRANSFORMERS_OFFLINE=1\)@#\1@' stablediff.env
  echo 'Maintenance mode \e[32;1mENABLED\e[0m'
  ./network.sh connect
  docker compose restart -t 0
else
  sed -i -e 's/respond "Maintenance mode, please come back later."/import sd # maintenance/' Caddyfile
  sed -i -e 's@^#\(.*freeze-settings.*\)@\1@' -e 's@\(^[^#].*enable-insecure-extension-access.*\)@#\1@' -e 's@#\(export TRANSFORMERS_OFFLINE=1\)@\1@' stablediff.env
  echo 'Maintenance mode \e[31;1mDISABLED\e[0m'
  ./network.sh disconnect
  docker compose restart -t 0
fi
