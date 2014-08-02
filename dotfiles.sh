#!/bin/bash

# dotfiles.sh 
# 1. Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# 2. Copies inputrc into /etc/inputrc if necessary

#dir=~/dotfiles  # where the dotfiles are. This folder is synced with GitHub

# The current directory, where the dotfiles ar. Usually it's ~/.dotfiles
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Loading files from dir $dir"

shopt -s dotglob
for file in $dir/* # for all files in this directory
do
        filename=$(echo $file | awk -F "/" '{ print $NF }') # returns only the filename
	echo $filename
	ln -s $file ~/$filename
done

