#! /bin/sh

DIR="$HOME/.config/fisher/"
if [ -d "$DIR" ]; then
    echo "fisher is already installed."
else
    curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    fish -C 'fisher install oh-my-fish/theme-bobthefish oh-my-fish/plugin-peco jethrokuan/z 0rax/fish-bd'
fi

rm -rf c $HOME/.config/fish/config.fish
ln -s $HOME/.dotfiles/fish/config.d/config.fish $HOME/.config/fish/config.fish
