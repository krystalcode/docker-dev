#!/bin/bash

. /root/.bashrc

if [ $# -eq 0 ]; then
    echo "Please provide the port to expose the language server on"
    exit
fi

port=$1

ghc_version=$2
if [ -z "${ghc_version}" ]
then
    ghc_version="9.12.1"
fi

export LANG=C.UTF-8

socat tcp-listen:"$port",reuseaddr exec:"haskell-language-server-${ghc_version}"
