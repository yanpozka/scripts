#!/bin/bash

#
# Update vim plugins:
#

bundle_dir=~/.vim/bundle

cd $bundle_dir

for dir in * ; do
	echo "$dir"
	cd $dir
	git pull
	git submodule update --recursive
	cd ..
done
