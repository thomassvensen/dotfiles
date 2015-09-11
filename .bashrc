alias l='ls -G'
alias la='ls -a -G'
alias ll='ls -l -G'
alias lh='ls -lha -G'
alias ..='cd ..'
alias ...='cd ../..'

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend

. ~/.git-completion.bash

export PS1="\t\[$(tput sgr0)\]:\W \$ "

