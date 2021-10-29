#!/bin/sh

# remove compiled lua files
rm -rf ~/.config/nvim/lua
sudo nixos-rebuild switch --flake '.#'
