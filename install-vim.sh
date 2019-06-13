#!/bin/bash

# apt-get install vim &&  :echo has('python')  Or compile from source code:
# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

echo "Downloading Pathogen ..."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

# vim-go
git clone https://github.com/fatih/vim-go.git
cd vim-go; git checkout tags/v1.20; cd ..

# 256 colors
mkdir -p /tmp/vim-colors-256
git clone https://github.com/JarrodCTaylor/vim-256-color-schemes.git /tmp/vim-colors-256
cp /tmp/vim-colors-256/colors/*.vim ~/.vim/colors

# nerdtree
git clone https://github.com/scrooloose/nerdtree.git

# nerdtree execute
# When navigating in NERDTree, select file or directory, press 'm' key, and NERDTree menu will appear. Press 'x' to execute
#
git clone https://github.com/ivalkeen/nerdtree-execute.git

# ctrl p
git clone https://github.com/ctrlpvim/ctrlp.vim.git 

# airline
git clone https://github.com/bling/vim-airline

# gitgutter
git clone https://github.com/airblade/vim-gitgutter.git

# commentary
# Usage: gc to comment or uncomment block of selected code (v)
#
git clone https://github.com/tpope/vim-commentary.git

# fast HTML editing
git clone https://github.com/mattn/emmet-vim.git

# :Gdiff  :Gsplit  :Gstatus  :Gblame  :Gcommit
git clone https://github.com/tpope/vim-fugitive.git

# Tagbar
sudo apt install -y exuberant-ctags
git clone https://github.com/majutsushi/tagbar.git
go get -v -u github.com/jstemmer/gotags

# Python
sudo pip install --upgrade pip

# jedi
sudo pip install --upgrade jedi
git clone --recursive https://github.com/davidhalter/jedi-vim.git

# autopep8
sudo pip install --upgrade autopep8
git clone https://github.com/tell-k/vim-autopep8.git


# JavaScript autoformat
#
# make sure this is the last one :P
#
git clone https://github.com/maksimr/vim-jsbeautify.git
cd vim-jsbeautify && git submodule update --init --recursive

