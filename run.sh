#! /usr/bin/env bash
set -o nounset;
set -o pipefail;
set -o errexit;
set -o xtrace;

docker run -it -v "$PWD/source:/source" -it crypto-wa 