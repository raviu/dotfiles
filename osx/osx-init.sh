#!/usr/bin/env bash
echo "Creating temporary directory for installations $HOME/init-dotfiles"
mkdir -p $HOME/init-dotfiles/
cd $HOME/init-dotfiles

sudo echo "Installing homebrew..." 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export PATH=/opt/homebrew/bin:$PATH
echo "Updating bash..."
brew install bash

echo "Adding latest bash to /etc/shells"
BASH_PATH=$(brew --prefix bash)
sudo bash -c "echo $BASH_PATH >> /etc/shells"

echo "Setting default shell to $BASH_PATH" 
chsh -s $BASH_PATH

echo "Installing bash-completion" 
brew install bash-completion

echo "Installing tmux..." 
brew install tmux 

echo "Installing tree..."
brew install tree 

# Cleanup 
echo "Removing temporary installations directory $HOME/init-dotfiles"
rm -rf $HOME/init-dotfiles
