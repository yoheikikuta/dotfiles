#! /bin/bash


echo 'Deploy settings'
LINK_FILE=settings.json

unlink ~/Library/Application\ Support/Code/User/settings.json &> /dev/null
ln -sf $PWD/vscode/config.d/settings.json ~/Library/Application\ Support/Code/User/settings.json

echo 'Install extensions'
EXTENSIONS=$(cat ./vscode/config.d/extensions.list)

for extension in ${EXTENSIONS[@]}; do \
  code --install-extension $extension; \
done