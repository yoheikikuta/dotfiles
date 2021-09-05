# dotfiles
This repository is based on https://github.com/himkt/dotfiles.  
Thanks for publishing a great repository!

Requirements: git


## osx

Updating dotfiles:

```
make all_osx
```

Initial setup:

```
git clone https://github.com/yoheikikuta/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles
make build_brew
make zsh_setup && source $HOME/.zshrc
make brew_bundle
make brew_bundle_opt
make brew_bundle_cask
make all_osx
```

## ubuntu (on GCP VM instance)

Updating dotfiles:

```
make all_ubuntu
```

Initial setup:

```
git clone https://github.com/yoheikikuta/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles
sudo apt update && sudo apt install -y make clang
make build_brew
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>  ~/.bashrc && source ~/.bashrc
make brew_bundle
make all_ubuntu
```
