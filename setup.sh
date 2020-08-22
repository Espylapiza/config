#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as root."
    exit 1
fi

# or replace it with gist url
url="https://raw.githubusercontent.com/Espylapiza/config/master"

if [[ "$(command -v apt)" ]]; then
    INSTALL_COMMAND="apt install -y"
elif [[ "$(command -v pacman)" ]]; then
    INSTALL_COMMAND="pacman -S"
else
    echo "Error: The package manager is supported."
    exit 1
fi

if [[ "$(command -v apt)" ]]; then
    add-apt-repository -y ppa:x4121/ripgrep
    apt update
fi

$INSTALL_COMMAND curl vim zsh ripgrep

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

cp /etc/passwd /etc/passwd.bak
sed -i -e "s_/bin/bash_/bin/zsh_" /etc/passwd

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
