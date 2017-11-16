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

# RUN /bin/bash -c "source ./emsdk_env.sh"
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# RUN source ./emsdk_env.sh
# ENV PATH "$PATH:/usr/local/emsdk-portable/emscripten/1.37.22"

RUN ./emsdk construct_env
RUN cat emsdk_set_env.sh >> /etc/environment

WORKDIR /src
