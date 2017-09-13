#! /usr/bin/env bash
set -o nounset;
set -o pipefail;
set -o errexit;
set -o xtrace;

docker build -t crypto-wa .