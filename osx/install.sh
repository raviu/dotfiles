#!/usr/bin/env bash

{ # force full script to download first

dotfiles=(.aliases .bash_profile .bash_prompt .exports .extra .functions .gitconfig .inputrc .path .profile .tmux.conf .vimrc)

echo "Downloading and running osx-init.sh"

BASE_URL="https://raw.githubusercontent.com/raviu/dotfiles/master/osx"

if command -v curl &> /dev/null 
then
    DOWNLOADER=curl
else 
    if command -v wget &> /dev/null
    then
        DOWNLOADER=wget
    fi
fi

if [ -z "$DOWNLOADER" ]; then
    echo "To continue install either wget or curl is required. Please install one of these utilities and try again."
    echo ""
    exit 1
else 

    for dotfile in ${dotfiles[@]}; do
        echo  "Downloading "$dotfile" to ~/$dotfile"
        if [ "$DOWNLOADER" == "curl" ]; then 
            curl -H 'Cache-Control: no-cache' -s $BASE_URL/$dotfile -o ~/$dotfile
        else 
            wget --no-cache -q $BASE_URL/$dotfile -O ~/$dotfile
        fi 
    done
    
    echo "Running osx-init.sh"
    if [ "$DOWNLOADER" == "curl" ]; then
        curl -H 'Cache-Control: no-cache' -o- "$BASE_URL/osx-init.sh" | bash
    else
        wget --no-cache -qO- "$BASE_URL/osx-init.sh" | bash
    fi

fi

CUR_DIR=$(pwd)
echo "Done"

} # force full script to download first
