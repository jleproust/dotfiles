#!/bin/sh

if [ "$(uname)" != "Darwin" ]
then
    DIR=$(dirname $(realpath -s "$0"))
else
    DIR=$(dirname $(realpath "$0"))
fi

for i in zshrc zsh vimrc vim tmux.conf
do
    if ! [ -e "$HOME/.$i" ]
    then
        ln -sfn "$DIR/$i" "$HOME/.$i"
    fi
done

if command -v htop > /dev/null
then
    mkdir -p "$HOME/.config/htop"
    ln -sfn "$DIR/htoprc" "$HOME/.config/htop/htoprc"
fi

NVIM_CONFIG="$HOME/.config/nvim"
if command -v nvim > /dev/null && ! [ -e "$NVIM_CONFIG/init.vim" ]
then
    mkdir -p "$NVIM_CONFIG"
    ln -sfn "$DIR/vimrc" "$NVIM_CONFIG/init.vim"
    ln -sfn "$DIR/vim/autoload" "$NVIM_CONFIG/autoload"
    ln -sfn "$DIR/vim/bundle" "$NVIM_CONFIG/bundle"
fi

if [ -d "$HOME/.ssh" ]
then
    ln -sfn "$DIR/ssh_rc" "$HOME/.ssh/rc"
fi

"$DIR/gitconfig.sh"
