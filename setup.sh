#!/bin/bash

echo "Setting up symlinks..."

echo "Adding: ln -sf ~/dotfiles/.zshrc ~/.zshrc"
ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "Adding: ln -sf ~/dotfiles/.vimrc ~/.vimrc"
ln -sf ~/dotfiles/.vimrc ~/.vimrc

echo "Adding: ln -sf ~/dotfiles/.gitconfig ~/.gitconfig"
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

echo "Adding: ln -sf ~/dotfiles/.aliases ~/.aliases"
ln -sf ~/dotfiles/.aliases ~/.aliases

echo "Adding: ln -sf ~/dotfiles/.zprofile ~/.zprofile"
ln -sf ~/dotfiles/.zprofile ~/.zprofile

echo "dotfiles setup complete. ✅"

