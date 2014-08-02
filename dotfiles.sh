#!/bin/bash

# dotfiles.sh Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/dotfiles  # where the dotfiles are. This folder is synced with GitHub

cd $dir
for file in dir do
        echo -n "symlink $file"
#       ln -s $dir/$file ~/.$file
done
