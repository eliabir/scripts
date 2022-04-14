#!/usr/bin/env bash

CONTAINER_STATUS="docker compose ps | tail -n 1 | cut -d '(' -f 2 | cut -d ')' -f 1"

PRINT_ONCE=0

CURRENT_STATUS=$(eval "$CONTAINER_STATUS")

echo "Container starting..."
echo "Status: $CURRENT_STATUS"

while true
do
    if [[ $(eval "$CONTAINER_STATUS") != $CURRENT_STATUS ]]
    then
        CURRENT_STATUS=$(eval "$CONTAINER_STATUS")
        echo "Status: $CURRENT_STATUS"
    fi

    if [[ $(eval "$CONTAINER_STATUS") == "healthy" ]]
    then
        echo "Container up!"
        break
    fi
done

exit 0
