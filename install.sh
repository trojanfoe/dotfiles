#!/bin/sh

thisdir=$(realpath $(dirname $0))
sys=$(uname -s)

mkdir $HOME/.config 2>/dev/null

# Replace the entire directort
config_dirs="zed"
for d in $config_dirs; do
  dest=~/.config/$d
  if test -d $dest; then
    rm -rf $dest
  fi
  ln -sf $thisdir/config/$d $dest
done

ln -sf $thisdir/zshrc ~/.zshrc
