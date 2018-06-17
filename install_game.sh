#!/bin/bash

name="neotokyo"
appid="313600"

# Create base server installation volume
if [[ $(docker volume ls -q | grep $name) -eq "" ]]; then
  docker volume create $name
fi
# Build the steamCMD image if it doesn't exist, so we have something to run steamcmd inside of.
if [[ $(docker image ls -q | grep steamcmd) -eq "" ]]; then
  docker build --tag steamcmd steamcmd
fi
# If building went well, let's install the game.
if [[ $? -eq 0 ]]; then
  docker run --name steamcmd -v $name:/game steamcmd /home/steam/steamcmd/steamcmd.sh @sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /game +app_update $appid validate +quit
fi
