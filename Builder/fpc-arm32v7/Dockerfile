FROM arm32v7/debian:stretch

COPY qemu-arm-static /usr/bin

RUN apt-get update && apt-get install -y build-essential

COPY fpc-3.2.0.arm-linux /tmp/fpc-install

RUN cd /tmp/fpc-install && bash install.sh && cd /root && rm -rf /tmp/fpc-install
