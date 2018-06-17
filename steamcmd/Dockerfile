FROM ubuntu:xenial
MAINTAINER Linn Engström <linn.engstroem@gmail.com>

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get -qq update \
    && apt-get -qq install -y software-properties-common python-software-properties \
    && add-apt-repository -y ppa:ubuntu-wine/ppa

RUN dpkg -qq --add-architecture i386 \
    && apt-get -qq update \
    && apt-get -qq install -y wine winetricks xvfb

## SteamCMD
RUN apt-get -qq install --no-install-recommends -y \
    ca-certificates \
    lib32gcc1 \
    curl
RUN mkdir -p /home/steam/steamcmd  && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/steam/steamcmd -zx

## Update steamcmd
RUN /home/steam/steamcmd/steamcmd.sh +quit

WORKDIR /home/steam/steamcmd
