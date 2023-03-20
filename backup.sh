#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Yellow='\033[0;33m'       # Yellow
Green='\033[0;32m'        # Green

TIME=$(date +"%Y-%m-%d_%H.%M.%S")
B_DIR=backups/${TIME}
B_WORLDDIR=${B_DIR}/world
B_LOGDIR=${B_DIR}/logs

M_DIR=minecraft
M_WORLDDIR=${M_DIR}/world
M_LOGDIR=${M_DIR}/logs

if [ -d ${M_WORLDDIR} ]; then
    mkdir -p ${B_DIR}
    cp -R ${M_WORLDDIR} ${B_WORLDDIR}

    if [ -d ${M_LOGDIR} ]; then
        cp -R ${M_LOGDIR} ${B_LOGDIR}
    else
        echo "${Red}No logs to backup at ${M_LOGDIR}!"
    fi

    cp ${M_DIR}/banned-ips.json ${M_DIR}/banned-players.json ${M_DIR}/ops.json ${M_DIR}/server-icon.png ${M_DIR}/server.properties ${M_DIR}/usercache.json ${M_DIR}/whitelist.json ${B_DIR}

    if [ $? == 0 ]; then
        SIZE=$(du -hs ${B_DIR})
        echo "${Green}Successfully backed up: ${SIZE} !"
    fi
else
	echo "${Red}No world to backup at ${M_WORLDDIR}!"
    exit -1
fi