bindkey -v
source lain_py/bin/activate

# Oh-my-posh
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/tokyo.omp.json)"

#nnn
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui'