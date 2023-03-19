#!/bin/sh

apt update && apt upgrade -y
apt install wget openjdk-17-jre-headless -y
cd /minecraft
FILE=server.jar
if [ ! -f "$FILE" ]; then
    wget https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar server.jar
fi
java -Xmx1024M -Xms1024M -jar server.jar nogui