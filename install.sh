#!/bin/bash

thisdir=$(realpath $(dirname $0))
sys=$(uname -s)

config_dirs="nvim"
if [[ $sys = Darwin ]]; then
  config_dirs="${config_dirs} kitty"

fi
for d in $config_dirs; do
  dest=~/.config/$d
  if ! test -h $dest; then
    rm -rf $dest
  fi
  ln -sf $thisdir/config/$d $dest
done

ln -sf $thisdir/zprofile ~/.zprofile
ln -sf $thisdir/zshrc ~/.zshrc
