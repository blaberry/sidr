FROM ubuntu:xenial
MAINTAINER Linn Engström <linn.engstroem@gmail.com>

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get update \
    && apt-get install -y software-properties-common python-software-properties \
    && add-apt-repository -y ppa:ubuntu-wine/ppa
EXPOSE 27015
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y wine winetricks xvfb
RUN mkdir /opt/neotokyo /opt/work /opt/upper


CMD ["mount -t overlayfs -o lower=/game,upper=/opt/upper,work=/opt/work overlayfs /opt/neotokyo"]
