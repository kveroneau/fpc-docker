FROM amd64/debian:stretch

RUN apt-get update && apt-get install -y build-essential

COPY fpc-3.0.4.x86_64-linux /tmp/fpc-install
COPY install.sh /tmp/fpc-install/

RUN cd /tmp/fpc-install && sh install.sh && cd /root && rm -rf /tmp/fpc-install
