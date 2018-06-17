FROM ubuntu:xenial
MAINTAINER Linn Engström <linn.engstroem@gmail.com>

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get update -q \
    && apt-get install -yq software-properties-common python-software-properties \
    && add-apt-repository -yq ppa:ubuntu-wine/ppa

RUN dpkg -q --add-architecture i386 \
    && apt-get -q update \
    && apt-get install -yq wine winetricks xvfb

## SteamCMD
RUN apt-get install --no-install-recommends -yq \
    ca-certificates \
    lib32gcc1 \
    curl
RUN mkdir -p /home/steam/steamcmd  && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/steam/steamcmd -zx

## Update steamcmd
RUN /home/steam/steamcmd/steamcmd.sh +quit

WORKDIR /home/steam/steamcmd
