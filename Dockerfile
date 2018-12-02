FROM python:3.6
LABEL maintainer="unclehook <https://github.com/unclehook/bleha>"

RUN apt-get update && apt-get install -y mosquitto-clients bluez-hcidump bc bluez xxd && rm -rf /var/lib/apt/lists/*

VOLUME /config

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/andrewjfreyer/monitor.git

WORKDIR /usr/src/app/monitor 

RUN chmod +x monitor.sh

CMD ["/usr/src/app/monitor/monitor.sh", "-D", "/config"]
