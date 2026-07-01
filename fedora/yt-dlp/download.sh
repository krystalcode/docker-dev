#!/bin/bash
#
# Downloads the media from the given link.

if [ $# -eq 0 ]; then
    echo "Please provide the download profile to use: \"best\", \"high\", \"normal\", \"low\" or \"audio\""
    exit
fi

# @I Validate the destination storage ID
if [ $# -eq 1 ]; then
    echo "Please provide the destination storage ID"
    exit
fi

if [ $# -eq 2 ]; then
    echo "Please provide the link to download the media from"
    exit
fi

profile=$1
destination=$2
link=$3

# This is to recognize the `deno` installation, globally installed by `npm`.
. ${HOME}/.nvm/nvm.sh && \

case "${profile}" in
    best)
        yt-dlp \
            --format "bv*+ba" \
            --paths "/data/${destination}" \
            "${link}"
        ;;

    high)
        yt-dlp \
            --format "best[height<=1080]" \
            --paths "/data/${destination}" \
            "${link}"
        ;;

    normal)
        yt-dlp \
            --format "best[height<=720]" \
            --paths "/data/${destination}" \
            "${link}"
        ;;

    low)
        yt-dlp \
            --format "best[height<=360]" \
            --paths "/data/${destination}" \
            "${link}"
        ;;

    audio)
        yt-dlp \
            -x \
            --audio-format best \
            --audio-quality 0 \
            --no-keep-video \
            --paths "/data/${destination}" \
            "${link}"
        ;;

    *)
        printf "Unknown download profile \"%s\"; supported profiles are \"best\", \"high\", \"normal\", \"low\" and \"audio\" are supported" "${profile}"
        ;;
esac
