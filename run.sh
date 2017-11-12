#! /usr/bin/env bash
set -o nounset;
set -o pipefail;
set -o errexit;
set -o xtrace;

docker run -it -v "$PWD/usr/local/emsdk-portable/src:/src" -v "$PWD/build:/build" -it crypto-wa