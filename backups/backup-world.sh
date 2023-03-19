#!/bin/bash

DIR=../minecraft/world
if [ -d "$DIR" ]; then
    WORLDBACKUPNAME=world_$(date +"%Y-%m-%d_%H.%M.%S")
    cp -r truc ${worldbackupname}
else
	echo "No world to backup at '${DIR}'"
fi
