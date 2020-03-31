#!/bin/sh

# You should run this from your host machine to build these tests.

docker run -it --rm -v `pwd`:/usr/src kveroneau/fpc:3.2.0 make "$@"
