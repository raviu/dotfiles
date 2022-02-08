#!/usr/bin/env bash
echo "Creating temporary directory for installations $HOME/init-dotfiles"
mkdir -p $HOME/init-dotfiles/
cd $HOME/init-dotfiles

sudo apt -y install bash-completion 
sudo apt -y install tmux 
sudo apt -y install tree
curl -O https://dl.google.com/go/go1.17.6.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
sudo chown -R $USER:$USER /usr/local/go/
export GOPATH=/usr/local/go/bin
export PATH=$PATH:$GOPATH
go install github.com/justjanne/powerline-go@latest

# Cleanup 
echo "Removing temporary installations directory $HOME/init-dotfiles"
rm -rf $HOME/init-dotfiles