FROM debian:stretch AS binutils

RUN apt-get update && apt-get -y install wget build-essential

RUN wget -O /tmp/binutils.tgz https://gnu.freemirror.org/gnu/binutils/binutils-2.28.1.tar.gz && cd /usr/src && tar -xzvf /tmp/binutils.tgz && rm -rf /tmp/binutils.tgz

RUN cd /usr/src/binutils-2.28.1 && ./configure --target=i386-go32 --prefix=/usr --program-prefix=i386-go32v2- --disable-werror && make && make install

RUN cd /usr && tar -czvf /tmp/go32v2.tgz bin/i386-go32v2-* i386-go32

FROM debian:stretch

COPY --from=binutils /tmp/go32v2.tgz /tmp/go32v2.tgz

RUN apt-get update && apt-get -y install nano wget build-essential xz-utils && cd /usr && tar -xzvf /tmp/go32v2.tgz && rm /tmp/go32v2.tgz

RUN cd /tmp && wget -O - ftp://mirror.freemirror.org/pub/fpc/dist/3.2.2/x86_64-linux/fpc-3.2.2.x86_64-linux.tar|tar -xvf -

COPY install.sh /tmp/fpc-3.2.2.x86_64-linux/install.sh

RUN cd /tmp/fpc-3.2.2.x86_64-linux && bash install.sh && cd /root && rm -rf /tmp/fpc-3.2.2.x86_64-linux

RUN cd /tmp && wget ftp://mirror.freemirror.org/pub/fpc/dist/3.2.2/x86_64-linux/fpc-3.2.2.x86_64-linux.cross.i8086-msdos.tar.xz && unxz fpc-3.2.2.x86_64-linux.cross.i8086-msdos.tar.xz && cd /usr && tar -xvf /tmp/fpc-3.2.2.x86_64-linux.cross.i8086-msdos.tar && rm -rf /tmp/fpc-3.2.2.x86_64-linux.cross.i8086-msdos.tar

RUN cd /tmp && wget ftp://mirror.freemirror.org/pub/fpc/dist/3.2.2/source/fpc-3.2.2.source.tar.gz && cd /usr/src && tar -xzvf /tmp/fpc-3.2.2.source.tar.gz && rm -rf /tmp/fpc-3.2.2.source.tar.gz && cd fpc-3.2.2 && make all OS_TARGET=go32v2 CPU_TARGET=i386 && make crossinstall OS_TARGET=go32v2 CPU_TARGET=i386 INSTALL_PREFIX=/usr && cd /usr/src && rm -rf fpc-3.2.2

RUN cd /usr/bin && ln -s ../lib/fpc/3.2.2/ppcross386 .

COPY pascal.nanorc /usr/share/nano/pascal.nanorc

COPY fpc.cfg /etc/fpc.cfg

VOLUME /usr/src

WORKDIR /usr/src
