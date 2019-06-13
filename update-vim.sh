#!/bin/bash

#
# Update vim plugins:
#

bundle_dir=~/.vim/bundle

cd $bundle_dir

for dir in * ; do
	[ -d "${dir}" ] || continue # if not a directory, skip

	echo "$dir"
	cd $dir
	git checkout master
	git pull origin master
	git submodule update --recursive
	cd ..
done

# restore vim-go
cd vim-go; git fetch; git checkout tags/v1.20

# 256 colors
mkdir -p /tmp/vim-colors-256
git clone https://github.com/JarrodCTaylor/vim-256-color-schemes.git /tmp/vim-colors-256
cp /tmp/vim-colors-256/colors/*.vim ~/.vim/colors
