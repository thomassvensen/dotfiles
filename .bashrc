alias l='ls -G'
alias la='ls -a -G'
alias ll='ls -l -G'
alias lh='ls -lha -G'
alias ..='cd ..'
alias ...='cd ../..'

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend

# export PS1="\t\[$(tput sgr0)\]:\W \$ "
# export PS1="\[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "
export PS1="\[\033[33m\]\w\[\033[36m\] \[\033[0m\]$ "
alias push="git push"
alias pull="git pull"
alias fetch="git fetch"
alias gcm="git commit -m"
alias gm="git co master && git pull"
alias ga="git add ."
alias gacm="git add . && git commit -m"
alias oeh="cd ~/dev/octopuseventhandler"
alias isc="cd ~/dev/ice-service-catalog"
alias iscf="cd ~/dev/ice-service-catalog/source/service-catalog.web/"
alias mon="cd ~/dev/monitoring"


gco() {
    git co `git b | grep $1`
}

grco() {
    fetch
    git co `git b -r | sed 's/origin\///g' | grep $1`
}

gacp() {
    git add . && git commit -m "$1" && push && fetch
}

eval "$(starship init bash)"
