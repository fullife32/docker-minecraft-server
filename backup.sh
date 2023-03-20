#!/bin/bash

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
        echo "No logs to backup at '${M_LOGDIR}'"
    fi

    cp ${M_DIR}/banned-ips.json ${M_DIR}/banned-players.json ${M_DIR}/ops.json ${M_DIR}/server-icon.png ${M_DIR}/server.properties ${M_DIR}/usercache.json ${M_DIR}/whitelist.json ${B_DIR}

    SIZE=$(du -hs ${B_DIR})
    echo "Successfully backed up: ${SIZE}"
else
	echo "No world to backup at '${M_WORLDDIR}'"
fi