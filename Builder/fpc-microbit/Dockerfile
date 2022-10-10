FROM kveroneau/fpc:3.2.0-amd64

RUN apt-get update && apt-get -y install wget build-essential

RUN wget -O /tmp/fpc-source.tgz ftp://mirror.freemirror.org/pub/fpc/dist/3.2.0/source/fpc-3.2.0.source.tar.gz && cd /usr/src && tar -xzvf /tmp/fpc-source.tgz && rm -rf /tmp/fpc-source.tgz

RUN wget -O /tmp/binutils.tgz https://gnu.freemirror.org/gnu/binutils/binutils-2.28.1.tar.gz && cd /usr/src && tar -xzvf /tmp/binutils.tgz && rm -rf /tmp/binutils.tgz

RUN cd /usr/src/binutils-2.28.1 && ./configure --target=arm-linux --prefix=/opt/binutils --program-prefix=arm-embedded- --disable-werror && make && make install

ENV PATH /opt/binutils/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN cd /usr/src/fpc-3.2.0 && make clean buildbase installbase CROSSINSTALL=1 OS_TARGET=embedded CPU_TARGET=arm SUBARCH=armv6m INSTALL_PREFIX=/usr && ln -s /usr/lib/fpc/3.2.0/ppcrossarm /usr/bin/

WORKDIR /root
