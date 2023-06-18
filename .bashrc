alias l='ls -G'
alias la='ls -a -G'
alias ll='ls -l -G'
alias lh='ls -lha -G'
alias ..='cd ..'
alias ...='cd ../..'

# export PS1="\[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "
export PS1="\[\033[33m\]\w\[\033[36m\] \[\033[0m\]$ "
alias s="git status"
alias add="git add"
alias push="git push"
alias pull="git pull"
alias fetch="git fetch"
alias commit="git commit"
alias gb="git branch"
alias gacm="git add . && git commit -m"
alias oeh="cd ~/dev/octopuseventhandler"
alias isc="cd ~/dev/ice-service-catalog"
alias iscf="cd ~/dev/ice-service-catalog/frontend/service-catalog.web/"
alias mon="cd ~/dev/monitoring"
alias oeh="cd ~/dev/octopuseventhandler"
alias ost="cd ~/dev/octopus-step-templates"
alias azu="cd ~/dev/azurecontainerservice"
alias jul="cd ~/dev/Julian.Web"
alias myn="cd ~/mynotes"

# C:\Program Files\JetBrains\JetBrains Rider 2022.2.1\bin\rider64.exe
alias r="/c/Program\ Files/JetBrains/JetBrains\ Rider\ 231.6471.8/bin/rider64.exe"

gm() {
    git co `git branch | grep -E "\bma"`&& git pull
}


gco() {
    git co `git b | grep $1`
}

grco() {
    fetch
    git co `git b -r | sed 's/origin\///g' | grep $1`
}

gacp() {
    dotnet format
    git add . && git commit -m "$1" && push && fetch
}

gap() {
    git add . && git commit -m "$1" && push && fetch
}

sship()  {
 eval "$(starship init bash)"
}

logtail() {
    tail -f $1 | grep -Eo "message[^,]*"
}

alias bwi="bw get password teamcity | clip"
alias bwa="bw get password srvadm | clip"

sship
