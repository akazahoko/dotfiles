#!/bin/zsh

# clean old .zshrc
rm $HOME/.zshrc

# export path to .config/zsh
echo 'export ZDOTDIR="$HOME/.config/zsh"' > "$HOME/.zshenv"

# ln zsh configs
ln -sf $HOME/.dotfiles/lainpad/zsh $HOME/.config

# mv zsh_history
mv $HOME/.zsh_history $HOME/.config/zsh

# install oh-my-zsh``
export KEEP_ZSHRC=yes
export RUNZSH=no
export ZSH="$HOME/.config/zsh/oh-my-zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install plugins
export ZSH_CUSTOM="$HOME/.config/zsh/oh-my-zsh/custom"`

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"

# theme: pl10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"