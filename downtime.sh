#!/bin/sh
cd "$(dirname "$0")"
if [ -n "$2" ]
then
  MINUTES=$2
  REASON=$1
else
  MINUTES=$1
fi
DEADLINE=$(date -d "$MINUTES minutes" +%s)
STARTED=$(date +%s)
echo '{ "eta": '$DEADLINE', "reason": "'$REASON'", "started": '$STARTED' }' > static/timeout.json
./start.sh stop
