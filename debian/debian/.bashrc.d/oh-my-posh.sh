# Configure the Bash shell to use `oh-my-posh` by default.
if [ -f `which oh-my-posh` ]; then
    eval "$(oh-my-posh init bash --config /root/.config/oh-my-posh/themes/runnah.minimal.omp.json)"
fi
