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


cd vim-go; git fetch; git checkout tags/v1.19
