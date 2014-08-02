#!/bin/bash

# dotfiles.sh Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/dotfiles  # where the dotfiles are. This folder is synced with GitHub

for file in $dir/* # for all files in this directory
do
        filename=$(echo $file | awk -F "/" '{ print $NF }') # returns only the filename
	ln -s $dir/$file ~/$filename
done
