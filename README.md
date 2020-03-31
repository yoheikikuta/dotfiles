# dotfiles

## ubuntu (on GCP VM instance)

```
$ sudo apt update && sudo apt install -y make clang
$ make build_brew
$ echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>  ~/.bashrc && source ~/.bashrc
$ make brew_bundle
$ make all_ubuntu
```