#!/bin/sh

git pull

git submodule sync
git submodule update --init --recursive --remote

