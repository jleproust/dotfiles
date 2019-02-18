#!/bin/sh

git pull

git submodule sync
git submodule update --init --recursive --remote

if [ "$(uname)" != "Darwin" ]
then
    DIR=$(dirname $(realpath -s "$0"))
else
    DIR=$(dirname $(realpath "$0"))
fi

"$DIR/install.sh"
