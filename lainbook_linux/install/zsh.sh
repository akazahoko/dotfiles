#!/bin/sh

# set default zsh config dir
echo "export ZDOTDIR=$HOME/.config/zsh" > /home/$USER/.zshenv

# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy to .config/zsh
cp -r /home/$USER/.oh-my-zsh/ /home/$USER/.config/zsh/

# omz plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting