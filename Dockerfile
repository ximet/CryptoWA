FROM ubuntu:16.04
MAINTAINER ximet <dq.ximet@gmail.com>

#--------------------Setting Ubuntu------------------------
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y build-essential && \
    apt-get install -y python2.7 && \
    npm config set python /usr/bin/python2.7 && \
    apt-get install -y git && \
	apt-get install -y cmake && \
    apt-get install -y clang && \
    apt-get install -y wget && \
    apt-get install -y awscli

# ------------------------ emscripten -----------------------------------------
RUN wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
RUN tar -xvf emsdk-portable.tar.gz
RUN cd ./emsdk_portable && \
	./emsdk update && \
	./emsdk install sdk-incoming-64bit && \
	./emsdk activate sdk-incoming-64bit
ENV PATH /binaryen/bin/:/node:/emsdk_portable:/emsdk_portable/clang/fastcomp/build_incoming_64/bin:\
	/emsdk_portable/node/4.1.1_64bit/bin:/emsdk_portable/emscripten/incoming:\
	/node/out/Release/:/sexpr-wasm-prototype/out/:/usr/local/sbin:/usr/local/bin:\
	/usr/sbin:/usr/bin:/sbin:/bin

# ---------------------------- run --------------------------------------------
WORKDIR /src
ENTRYPOINT cd /build && \
	emcc /src/example.c -s BINARYEN=1 -O0 -s ONLY_MY_CODE=1 -o index.js && \
	sexpr-wasm /build/index.wast -o /build/example.wasm && \
	/node/out/Release/node --expose-wasm /src/index.js && \
	chmod ugo+rw *