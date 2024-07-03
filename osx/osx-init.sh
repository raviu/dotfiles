#!/usr/bin/env bash
echo "Creating temporary directory for installations $HOME/init-dotfiles"
mkdir -p $HOME/init-dotfiles/
cd $HOME/init-dotfiles

echo "Installing homebrew..." 
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Updating bash..."
brew install bash

echo "Adding latest bash to /etc/shells"
echo /usr/local/bin/bash >> /etc/shells
echo "Setting default shell to bash" 
chsh -s /usr/local/bin/bash

echo "Installing bash-completion" 
brew install bash-completion

echo "Installing tmux..." 
brew install tmux 

echo "Installing tree..."
brew install tree 

# Cleanup 
echo "Removing temporary installations directory $HOME/init-dotfiles"
rm -rf $HOME/init-dotfiles