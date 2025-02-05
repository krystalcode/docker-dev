#!/bin/bash

. /root/.bashrc

if [ $# -eq 0 ]; then
    echo "Please provide the port to expose the language server on"
    exit
fi

port=$1

export LANG=C.UTF-8

socat tcp-listen:"$port",reuseaddr exec:"biome lsp-proxy"
