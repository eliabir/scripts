#!/usr/bin/env bash

# Colors
BLUE="\e[34m"
YELLOW="\e[1;33m"
ENDCOL="\e[0m"

CONTAINER_STATUS="docker compose ps | tail -n 1 | cut -d '(' -f 2 | cut -d ')' -f 1"

PRINT_ONCE=0

CURRENT_STATUS=$(eval "$CONTAINER_STATUS")

echo "${BLUE}Container starting...${ENDCOL}"
echo "${BLUE}Status:${ENDCOL} ${YELLOW}$CURRENT_STATUS${ENDCOL}"

while true
do
    if [[ $(eval "$CONTAINER_STATUS") != $CURRENT_STATUS ]]
    then
        CURRENT_STATUS=$(eval "$CONTAINER_STATUS")
        echo -e "${BLUE}Status:${ENDCOL} ${YELLOW}$CURRENT_STATUS${ENDCOL}"
    fi

    if [[ $(eval "$CONTAINER_STATUS") == "healthy" ]]
    then
        echo "${YELLOW}Container up!${ENDCOL}"
        break
    fi
done

exit 0
