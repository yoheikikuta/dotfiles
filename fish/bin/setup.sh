

curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fish -C 'fisher add oh-my-fish/theme-bobthefish oh-my-fish/plugin-peco jethrokuan/z 0rax/fish-bd'

rm -rf c $HOME/.config/fish/config.fish
ln -s `pwd`/fish/config.d/config.fish $HOME/.config/fish/config.fish