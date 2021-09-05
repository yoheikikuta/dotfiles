# Makefile for dotfile configs
UNAME_S    := $(shell uname -s)
BREW       := $(shell which brew 2> /dev/null)
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

ifeq ($(UNAME_S),Darwin)
	BREW_COMPILER := /bin/bash -c
	BREW_SOURCE := https://raw.githubusercontent.com/Homebrew/install/master/install.sh
else
	BREW_COMPILER := sh -c
	BREW_SOURCE := https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh
endif

ifeq ($(BREW),)
	BREW_COMMAND := yes ' '| $(BREW_COMPILER) "$$(curl -fsSL $(BREW_SOURCE))"
endif

.PHONY: all_osx \
        all_ubuntu \
        build_brew

all_osx: clean setup vscode_setup done
all_ubuntu: clean setup done
setup: zsh_setup tmux_setup vim_setup fish_setup git_setup

build_brew:
	$(BREW_COMMAND)
brew_bundle:
	brew install gcc python3 tmux wget zsh fish peco
brew_bundle_opt:
	brew install coreutils htop tree bat ghq
brew_bundle_cask:
	brew install google-chrome google-backup-and-sync --cask
	brew install 1password visual-studio-code  --cask

clean:
	@echo 'remove symbolic links'
	rm -rf "$(HOME)/.vimrc"
	rm -rf "$(HOME)/.zshrc"
	rm -rf "$(HOME)/.config/fish/config.fish"
	rm -rf "$(HOME)/.tmux.conf"
	rm -rf "$(HOME)/.vim"
	rm -rf "$(HOME)/.gitconfig"
	@echo 'done'

fish_setup:
	sh $(PWD)/fish/bin/setup.sh

vim_setup:
	sh $(PWD)/vim/bin/setup.sh

vscode_setup:
	sh $(PWD)/vscode/bin/setup.sh

tmux_setup:
	sh $(PWD)/tmux/bin/setup.sh

zsh_setup:
	sh $(PWD)/zsh/bin/setup.sh

git_setup:
	sh $(PWD)/git/bin/setup.sh

done:
	@echo ""
	@echo "### Finish installing dotfiles!"
	@echo "Please run $(RED)source $$HOME/.zshrc$(NOCOLOR) on zsh to enable configures."
	@echo ""
	@echo "---"
	@echo ""
	@echo "### Packages"
	@echo "- If you want to use linuxbrew/homebrew,"
	@echo "  please run $(RED)make brew_bundle$(NOCOLOR)."
	@echo "  Please run $(RED)make build_brew$(NOCOLOR) before"
	@echo "  if you have not installed brew yet"
	@echo "  $(RED)make brew_bundle_opt$(NOCOLOR) installs optional packages"
	@echo ""
