#!/bin/bash
set -x

thisdir=$(realpath $(dirname $0))

for d in nvim kitty
do
    dest=~/.config/$d
    if [[ -d $dest ]]; then
        rm -rf ~/.config/$d
    fi
    ln -sf $thisdir/config/$d $dest
done

ln -sf $thisdir/zshrc ~/.zshrc
