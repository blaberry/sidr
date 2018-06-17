#!/bin/bash

name="neotokyo"
appid="313600"
maxplayers="12"
if [ $(docker volume ls -q | grep $name) -eq "" ] then
  echo "no docker volume called " + $name + " found."
  exit 1
fi

docker run -P -v $name:/game $name -w /opt/$name --name "$(curl -L 'https://uzby.com/api.php?min=4&max=9')" \
Xvfb :1 -screen 0 800x600x8 & \
export DISPLAY=:1 \
wine start srcds.exe -console -game NeotokyoSource -port 27015 +maxplayers $maxplayers +exec server.cfg +map nt_dawn_ctg
