#!/bin/bash

name="neotokyo"
appid="313600"

if [ $(docker volume ls -q | grep $name) == "" ] then
  docker volume create $name
fi

docker run -v $name:/game steamcmd steamcmd "@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /game +app_update $appid validate +quit"
