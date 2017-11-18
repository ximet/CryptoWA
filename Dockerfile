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

# RUN ./emsdk construct_env
# RUN cat emsdk_set_env.sh >> /etc/environment

RUN ver=$(tail -n 1 emscripten-tags.txt)
RUN echo $ver
ENV PATH "$PATH:/usr/local/emsdk-portable/emscripten/1.37.22"
# ENV PATH "$PATH:/usr/local/emsdk-portable:/usr/local/emsdk-portable/clang/e1.37.22_64bit:/usr/local/emsdk-portable/node/4.1.1_64bit/bin:/usr/local/emsdk-portable/emscripten/1.37.22:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# RUN ./emsdk construct_env
# RUN cat emsdk_set_env.sh >> /etc/environmentTemp
# RUN cp /dev/null /etc/environment
# RUN sed -e 's/\<export\>//g' /etc/environmentTemp >> /etc/environment
# # next command working only in container
# RUN sed 's/^/export /' /etc/environment > /tmp/env.sh && . /tmp/env.sh 

WORKDIR /src
