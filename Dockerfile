FROM ubuntu:latest
MAINTAINER ximet <dq.ximet@gmail.com>

WORKDIR /usr/local/emsdk-portable

RUN apt-get update && apt-get install -y wget python cmake git
RUN (cd /tmp \
 && wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz \
 && tar zxf emsdk-portable.tar.gz -C /usr/local)
RUN ./emsdk update && ./emsdk install latest && ./emsdk activate latest
RUN /bin/bash -c "source ./emsdk_env.sh "