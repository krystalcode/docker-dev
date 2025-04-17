# Run `gcloud` with all required options pre-filled.
alias g='gcloud --project ${GCLOUD_PROJECT} --account ${GCLOUD_ACCOUNT}'

if g projects list &> /dev/null; then
    echo "Logged as as ${GCLOUD_ACCOUNT}"
else
    g auth login
    g auth list
fi
