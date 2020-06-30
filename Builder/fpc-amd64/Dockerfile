FROM amd64/debian:buster

RUN apt-get update && apt-get install -y build-essential

COPY fpc-3.2.0-x86_64-linux /tmp/fpc-install
COPY install.sh /tmp/fpc-install/

RUN cd /tmp/fpc-install && bash install.sh && cd /root && rm -rf /tmp/fpc-install
