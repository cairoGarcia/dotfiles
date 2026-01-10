#!/usr/bin/sh

cp -i ./src/.bashrc ~
cp -i ./src/.tmux.conf ~
cp -ri ./src/.config/nvim ~/.config
cp -ri ./src/.config/wofi ~/.config
cp -ri ./src/.config/hypr ~/.config
cp -ri ./src/.config/kitty ~/.config
cp -ri ./src/.config/tmux ~/.config
cp -ri ./src/.config/wallpapers ~/.config

sudo pacman -S git openssh rustup gcc lua nasm qemu wofi hyprland hyprpaper hyprlock hyprpolkitagent kitty tmux --noconfirm
yay -S zen-browser-bin --noconfirm
yay -S aur/neovim-nightly-bin
