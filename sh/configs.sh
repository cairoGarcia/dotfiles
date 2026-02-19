#!/usr/bin/sh

echo ".bashrc requires sudo-rs package, install it before applying"
cp -i ./src/.bashrc ~
cp -i ./src/.tmux.conf ~
cp -ri ./src/.fonts ~
cp -ri ./src/.config/nvim ~/.config
cp -ri ./src/.config/hypr ~/.config
cp -ri ./src/.config/kitty ~/.config
cp -ri ./src/.config/xfconf ~/.config
cp -ri ./src/.config/wallpapers ~/.config
