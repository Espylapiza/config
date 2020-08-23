#!/bin/bash

# or replace it with gist url
url="https://raw.githubusercontent.com/Espylapiza/config/master"

if [ "$EUID" -ne 0 ]
    then echo "Please run as root."
    exit 1
fi

if [[ "$(command -v apt-get)" ]]; then
    INSTALL_COMMAND="apt-get install -y"
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

$INSTALL_COMMAND curl git neovim zsh ripgrep

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

cp /etc/passwd /etc/passwd.bak
sed -i -e "s_/bin/bash_/bin/zsh_" /etc/passwd

mkdir -p ~/.config/nvim
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
wget "$url/~/.config/nvim/init.vim" -O ~/.config/nvim/init.vim

mv ~/.tmux.conf ~/.tmux.conf.bak
wget "$url/~/.tmux.conf" -O ~/.tmux.conf

mv ~/.zshrc ~/.zshrc.bak
wget "$url/~/.zshrc" -O ~/.zshrc

mkdir -p ~/.ssh
mv ~/.ssh/config ~/.ssh/config.bak
wget "$url/~/.ssh/config" -O ~/.ssh/config

