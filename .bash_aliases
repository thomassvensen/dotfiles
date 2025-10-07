alias s="git status"
alias add="git add"
alias b="git branch"
alias co="git checkout"
alias d="git diff"
alias l="git l"
alias la="git la"
alias lo="git lo"
alias push="git push"
alias pull="git pull"
alias p="git pull"
alias pf="git push --force-with-lease"
alias fetch="git fetch"
alias commit="git commit"

alias n="nnn"
alias ..="cd .."

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
