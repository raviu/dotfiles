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
    echo "Downloading deb-init.sh to /usr/local/bin"
    if [ "$DOWNLOADER" == "curl" ]; then 
        curl -s $BASE_URL/deb-init.sh -o ~/deb-init.sh
    else 
        wget -q $BASE_URL/deb-init.sh -O ~/deb-init-sh
    fi 

    chmod +x ~/deb-init.sh

    for dotfile in ${dotfiles[@]}; do
        echo  "Downloading "$dofile" to ~/$dotfile" 
        if [ "$DOWNLOADER" == "curl" ]; then 
            curl -s "$BASE_URL/$dotfile" -o "~/$dotfile"
        else 
            wget -q "$BASE_URL/$dotfile" -O "~/$dotfile"
        fi 
    done
    
fi

CUR_DIR=$(pwd)
echo "Running deb-init.sh from /usr/local/bin"
~/deb-init.sh

} # force full scrip to download first