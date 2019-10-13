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
cd vim-go; git fetch; git checkout tags/v1.21

# 256 colors
rm -rf /tmp/vim-colors-256
mkdir -p /tmp/vim-colors-256
git clone https://github.com/yanpozka/vim-256-color-schemes.git /tmp/vim-colors-256
cp /tmp/vim-colors-256/colors/*.vim ~/.vim/colors
