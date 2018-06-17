# SRCDS image docker repository

## What's this?
The SRCDS docker image repository is a way of structuring Source-engine server instances with as little data duplication as possible.

## Why?
I started this project to help the NEOTOKYO° community host PUG games.

Steamcmd image: hosts SteamCMD, mounts volume, installs game to volume.
Game image: mounts volume, mounts overlayfs ontop of volume, runs srcds, with wine if necessary.
mapdownloader: mounts volume, wgets .bsp from publicly accessible URI
