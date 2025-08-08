#!/bin/bash

if [ $# -eq 0 ]; then
    printf "[ERROR] Please provide the model\n"
    exit
fi

model=$1

tabby download --model "${model}"

if [ $# -eq 1 ]; then
    tabby serve --mode "${model}"
else
    tabby serve --mode "${model}" --chat-model "$2"
fi
