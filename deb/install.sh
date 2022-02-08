#!/usr/bin/env bash

{ # force full scrip to download first

dotfiles=(.aliases .bash_profile .bash_prompt .exports .extra .functions .gitconfig .inputrc .path .profile .tmux.conf .vimrc)

echo "Downloading and running deb-init.sh"

BASE_URL="https://raw.githubusercontent.com/raviu/dotfiles/master/deb"

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
            curl -s "$BASE_URL/$dotfile" -o "~/$dotfile"
        else 
            wget -q "$BASE_URL/$dotfile" -O "~/$dotfile"
        fi 
    done
    
    echo "Running deb-init.sh"
    if [ "$DOWNLOADER" == "curl" ]; then
        curl -H 'Cache-Control: no-cache' -o- "$BASE_URL/deb-init.sh" | bash
    else
        wget --no-cache -qO- "$BASE_URL/deb-init.sh" | bash
    fi

fi

CUR_DIR=$(pwd)
echo "Done"

} # force full scrip to download first