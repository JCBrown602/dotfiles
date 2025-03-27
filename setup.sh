#!/bin/bash

echo "Setting up symlinks..."

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.zprofile ~/.zprofile

echo "dotfiles setup complete. ✅"

