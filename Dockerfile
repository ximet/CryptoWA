FROM ubuntu:latest
MAINTAINER ximet <dq.ximet@gmail.com>

WORKDIR /usr/local/emsdk-portable

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y python && \
    apt-get install -y cmake && \
    apt-get install -y git && \
     apt-get install -y vim

RUN (cd /tmp \
 && wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz \
 && tar zxf emsdk-portable.tar.gz -C /usr/local)
RUN ./emsdk update && ./emsdk install latest && ./emsdk activate latest


RUN ver=$(tail -n 1 emscripten-tags.txt)
RUN echo $ver
ENV PATH "$PATH:/usr/local/emsdk-portable/emscripten/"$ver;

WORKDIR /src
