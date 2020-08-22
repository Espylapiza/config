#!/bin/bash

# or replace it with gist url
url="https://raw.githubusercontent.com/Espylapiza/config/master"

sudo apt update
sudo apt install -y curl vim zsh ripgrep
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo sed -i -e "s_/bin/bash_/bin/zsh_" /etc/passwd

mv ~/.vimrc ~/.vimrc.bak
mv ~/.tmux.conf ~/.tmux.conf
mv ~/.zshrc ~/.zshrc.bak

wget "$url/.vimrc" -O ~/.vimrc
wget "$url/.tmux.conf" -O ~/.tmux.conf
wget "$url/.zshrc" -O ~/.zshrc
