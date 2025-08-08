#!/bin/bash

if [ $# -eq 0 ]; then
    printf "[ERROR] Please provide the action\n"
    exit
fi

action=$1

if [ $# -eq 1 ]; then
    printf "[ERROR] Please provide the model\n"
    exit
fi

model=$2

case "${action}" in
    download)
        tabby download --model "${model}"
        ;;

    run)
        if [ $# -eq 2 ]; then
            tabby serve --model "${model}"
        else
            chat_model=$3
            tabby serve --model "${model}" --chat-model "${chat_model}"
        fi
        ;;

    *)
        printf "[ERROR] Unsupported action ${action}\n"
        exit
        ;;
esac
