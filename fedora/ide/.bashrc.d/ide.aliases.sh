# Silver searcher.
alias ag="ag --color-path 36 --color-match 32 --color-line-number '1;30'"

# Sync aliases to eshell.
alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" > ~/.emacs.d/eshell/alias
