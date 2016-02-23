#!/bin/sh

DIR=$(dirname $(realpath -s "$0"))

STUFF="zshrc zsh vimrc vim"

for i in $STUFF
do
    ln -sfn "$DIR/$i" "$HOME/.$i"
done
