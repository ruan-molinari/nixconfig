#!/usr/bin/env bash
echo "Stowing dotfiles..."
stow -S -t $HOME/.config -d ../ dotfiles
echo "Finished!"
