FROM python:3.6
LABEL maintainer="unclehook <https://github.com/unclehook/bleha>"

RUN apt-get update
RUN apt-get install -y mosquitto-clients bluez-hcidump 
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

VOLUME /config

RUN git clone https://github.com/andrewjfreyer/monitor.git

WORKDIR /usr/src/app/monitor 

RUN chmod +x monitor.sh

#RUN ./monitor.sh -D /config
