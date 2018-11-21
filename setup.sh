#!/usr/bin/env sh

REAL_PATH=$(python -c "import os,sys;print os.path.realpath('$0')")
DIR_NAME=$(dirname "$REAL_PATH")
if [ ! -d $HOME/.vim ]; then
    mkdir $HOME/.vim
    echo "Install colors ..."
    cp -rf $DIR_NAME/colors $HOME/.vim
    cp $DIR_NAME/vimrc $HOME/.vimrc
    echo "Install colors finished"
else
    echo "Directory already exist"
    exit 1
fi
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Install vundle ..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi
