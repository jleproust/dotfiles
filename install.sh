#!/bin/sh

if [[ $(uname) != 'Darwin' ]]
then
    DIR=$(dirname $(realpath -s "$0"))
else
    DIR=$(dirname $(realpath "$0"))
fi

STUFF="zshrc zsh vimrc vim tmux.conf"
for i in $STUFF
do
    ln -sfn "$DIR/$i" "$HOME/.$i"
done

if command -v htop > /dev/null
then
    mkdir -p "$HOME/.config/htop"
    ln -sfn "$DIR/htoprc" "$HOME/.config/htop/htoprc"
fi

if command -v nvim > /dev/null
then
    NVIM_CONFIG="$HOME/.config/nvim"
    mkdir -p "$NVIM_CONFIG"
    ln -sfn "$DIR/vimrc" "$NVIM_CONFIG/init.vim"
    ln -sfn "$DIR/vim/autoload" "$NVIM_CONFIG/autoload"
    ln -sfn "$DIR/vim/bundle" "$NVIM_CONFIG/bundle"
fi

