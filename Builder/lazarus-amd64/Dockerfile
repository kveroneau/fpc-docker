FROM kveroneau/fpc:3.0.4-amd64

ADD lazarus /usr/src/lazarus

RUN apt-get update && apt-get install -y libgdk-pixbuf2.0-dev libx11-dev libgtk2.0-dev libglib2.0-dev libpango1.0-dev libcairo2-dev libatk1.0-dev  && cd /usr/src/lazarus && make bigide

ENV PATH /usr/src/lazarus:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir /root/.lazarus

COPY environmentoptions.xml /root/.lazarus/
