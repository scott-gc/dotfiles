#!/usr/bin/env bash

vundle_path="$HOME/.vim/bundle/Vundle.vim"
vundle_repo="https://github.com/VundleVim/Vundle.vim.git"

echo "$vundle_path"

if [ -d $vundle_path ]; then
    echo "Updating Vundle..."

    cd $vundle_path
    git pull
else
    echo "Installing Vundle..."
    git clone "$vundle_repo" "$vundle_path"
fi

# update or install any new pluggins added to vim
