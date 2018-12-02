FROM python:3.6
LABEL maintainer="unclehook <https://github.com/unclehook/bleha>"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

VOLUME /config

RUN apt-get install -y mosquitto-clients bluez-hcidump bc bluez && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/andrewjfreyer/monitor.git

WORKDIR /usr/src/app/monitor 

RUN chmod +x monitor.sh

CMD ["/usr/src/app/monitor/monitor.sh", "-D", "/config"]
