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
if ! grep -q "$BASE_PATH/bin/bash" /etc/shells; then
  sudo bash -c "echo $BASH_PATH/bin/bash >> /etc/shells"
fi

echo "Setting default shell to $BASH_PATH/bin/bash" 
chsh -s $BASH_PATH/bin/bash

echo "Installing bash-completion" 
brew install bash-completion

echo "Installing tmux..." 
brew install tmux 

echo "Installing tree..."
brew install tree 

echo "Install skdman..."
/bin/bash -c "$(curl -s https://get.sdkman.io)"
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Cleanup 
echo "Removing temporary installations directory $HOME/init-dotfiles"
rm -rf $HOME/init-dotfiles
