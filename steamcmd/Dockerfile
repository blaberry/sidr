FROM ubuntu:xenial
MAINTAINER Linn Engström <linn.engstroem@gmail.com>

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get update \
    && apt-get install -fy software-properties-common python-software-properties \
    && add-apt-repository -y ppa:ubuntu-wine/ppa

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -fy wine winetricks xvfb

## SteamCMD
RUN useradd --home-dir /home/steam --create-home steam
RUN apt-get install --no-install-recommends -fy \
    ca-certificates \
    lib32gcc1 \
    curl
RUN mkdir -p /home/steam/steamcmd  && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/steam/steamcmd -zx && \
    chown -R steam:steam /home/steam

#USER steam

## Update steamcmd
RUN /home/steam/steamcmd/steamcmd.sh +quit

WORKDIR /home/steam/steamcmd
CMD ["/home/steam/steamcmd/steamcmd.sh"]
