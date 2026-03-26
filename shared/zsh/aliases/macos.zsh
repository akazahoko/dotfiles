brews() {
    if [ $# -eq 0 ]; then
        brew upgrade;
        brew cu -a
    else
        brew install $@
    fi
}

alias brewc="brew autoremove"
alias brewr="brew uninstall"
alias brewx="brew cleanup"
alias brewf="brew search"
alias brewq="brew info"
