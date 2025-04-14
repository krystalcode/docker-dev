eval "$(atuin init bash)"

status=$(atuin status)
if [ "${status#You are not logged in}" != "${status}" ]; then
    echo "Not logged in to an Atuin server"
else
    echo "$status"
    atuin sync
fi
