#!/bin/bash

lagoon_environment=$1
remote_path=$2
local_path=$3

if [ -z ${lagoon_environment} ]; then
    echo "Please provide the lagoon environment to copy from"
    exit
fi
if [ -z ${remote_path} ]; then
    echo "Please provide the remote path to copy from"
    exit
fi
if [ -z ${local_path} ]; then
    echo "Please provide the local path to copy to"
    exit
fi

echo "Lagoon SSH Hostname: ${LAGOON_SSH_HOSTNAME}"
echo "Lagoon Project: ${LAGOON_PROJECT}"
echo "Lagoon Environment: ${lagoon_environment}"
echo "Remote Path: ${remote_path}"
echo "Local Path: ${local_path}"

command="${LAGOON_PROJECT}-${lagoon_environment////-}@${LAGOON_SSH_HOSTNAME}:${remote_path} ${local_path}"
echo "Rsync Command: ${command}"

rsync \
    --rsh='ssh -i /root/.ssh/id_ed25519 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p 22' \
    --progress \
    ${command}
