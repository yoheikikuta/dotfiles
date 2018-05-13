#!/bin/sh
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim

ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/git/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml
ln -sf ~/git/dotfiles/.ideavimrc ~/.ideavimrc
