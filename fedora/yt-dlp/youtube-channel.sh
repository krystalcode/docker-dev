#!/bin/bash
#
# Downloads all media from the given YouTube channel.
#
# @I Implement with `shellfire` or `argc`

# @I Support a file containing a list of channel IDs
if [ $# -eq 0 ]; then
    echo "Please provide the ID of the YouTube channel"
    exit
fi

# @I Validate channel ID e.g. no spaces or special characters
# @I Validate that the channel exists
channel_id=$1

if [ $# -eq 1 ]; then
    profile="${YT_DLP_DEFAULT_PROFILE}"
else
    profile=$2
fi

# @I Validate the destination storage ID
if [ $# -lt 3 ]; then
    if [[ -z "${YT_DLP_CHANNEL_STORAGE+x}" ]]; then
        echo "Please provide the destination storage ID"
        exit
    else
        destination="${YT_DLP_CHANNEL_STORAGE}"
    fi
else
    destination=$3
fi
destination_realpath="/data/${destination}"
if [ ! -d "${destination_realpath}" ]; then
    echo "The destination folder \"${destination_realpath}\" does not exist"
    exit
fi

channel_url="https://www.youtube.com/@${channel_id}"
channel_destination="${destination}/YouTube/${channel_id}"
channel_realpath="${destination_realpath}/YouTube/${channel_id}"

if [ ! -d "${channel_realpath}" ]; then
    mkdir "${channel_realpath}"
fi

download "${profile}" "${channel_destination}" "${channel_url}"
