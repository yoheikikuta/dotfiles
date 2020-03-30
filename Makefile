# Makefile for dotfile configs
UNAME_S    := $(shell uname -s)
BREW       := $(shell which brew 2> /dev/null)
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

ifeq ($(UNAME_S),Darwin)
	BREW_COMPILER := /usr/bin/ruby -e
	BREW_SOURCE := https://raw.githubusercontent.com/Homebrew/install/master/install
else
	BREW_COMPILER := sh -c
	BREW_SOURCE := https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh
endif

ifeq ($(BREW),)
	BREW_COMMAND := yes ' '| $(BREW_COMPILER) "$$(curl -fsSL $(BREW_SOURCE))"
endif

.PHONY: all \
        build_brew brew_bundle_tiny

all: clean setup done
setup: zsh_setup tmux_setup vim_setup vscode_setup zsh_setup

build_brew:
	$(BREW_COMMAND)
brew_bundle:
	brew install gcc python3 tmux wget zsh
brew_bundle_opt:
	brew install coreutils htop tree bat ghq
brew_bundle_cask:
	brew cask install google-chrome google-backup-and-sync
	brew cask install 1password iterm2 visual-studio-code

clean:
	@echo 'remove symbolic links'
	rm -rf "$(HOME)/.vimrc"
	rm -rf "$(HOME)/.zshrc"
	rm -rf "$(HOME)/.tmux.conf"
	rm -rf "$(HOME)/.vim"
	@echo 'done'

vim_setup:
	$(PWD)/vim/bin/setup.sh

vscode_setup:
	$(PWD)/vscode/bin/setup.sh

tmux_setup:
	$(PWD)/tmux/bin/setup.sh

zsh_setup:
	$(PWD)/zsh/bin/setup.sh

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