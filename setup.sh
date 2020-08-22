#!/bin/bash

# or replace it with gist url
url="https://raw.githubusercontent.com/Espylapiza/config/master"

sudo add-apt-repository -y ppa:x4121/ripgrep
sudo apt update
sudo apt install -y curl vim zsh ripgrep
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

sudo cp /etc/passwd /etc/passwd.bak
sudo sed -i -e "s_/bin/bash_/bin/zsh_" /etc/passwd

mv ~/.vimrc ~/.vimrc.bak
mv ~/.tmux.conf ~/.tmux.conf
mv ~/.zshrc ~/.zshrc.bak
mkdir -p ~/.ssh
mv ~/.ssh/config ~/.ssh/config.bak

https://raw.githubusercontent.com/Espylapiza/config/master/.ssh/config

wget "$url/.vimrc" -O ~/.vimrc
wget "$url/.tmux.conf" -O ~/.tmux.conf
wget "$url/.zshrc" -O ~/.zshrc
wget "$url/.ssh/config" -O ~/.ssh/config
