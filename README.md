# crypto-wa

How start:

1) Install docker 
2) run bash script: sh build.sh
3) run bash script: sh run.sh
4) run command in docker: source ../usr/local/emsdk-portable/emsdk_env.sh
5) open VIM and write some C code 
6) run command in docker: emcc YOUR_FILE.c -s WASM=1 -s SIDE_MODULE=1 -o YOUR_FILE.wasm

Checklist:

1) Need to update dockerfile
2) check WA
