#!/bin/sh

git config --global color.ui true

git config --global alias.wu "log --stat origin..@{0}"
git config --global alias.wup "log -p origin..@{0}"

git config --global user.email "julien@kwet.org"
git config --global user.name "Julien Leproust"

git config --global user.signingkey D310014ECAEE4CDF

git config --global pull.rebase true
git config --global rebase.autostash true

git config --global core.hooksPath hooks
