#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Yellow='\033[0;33m'       # Yellow
Green='\033[0;32m'        # Green

if [ ! -z $1 ]; then
	if [ ! -d $1 ]; then
		echo "${Red}Backup folder not found!"
		exit -1
	fi

	read -p "Are you sure (v. $1)? (y/n) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		read -p "Backup actual server? (y/n) " -n 1 -r
		echo "${Red}"
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			sh backup.sh
			if [ $? != 0 ]; then
				exit -1
			fi
		fi

		cp -r $1/* minecraft
		if [ $? == 0 ]; then
			echo "${Green}Successfully rollbacked to version $1 !"
		fi
	else
		echo "${Red}Rollback aborted"
		exit -1
	fi
else
	echo "${Yellow}sh rollback.sh <backup folder>"
	exit -1
fi