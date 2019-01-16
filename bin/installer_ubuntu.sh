#!/bin/sh

DOT_DIRECTORY="${HOME}/dotfiles"
REMOTE_URL="https://github.com/yoheikikuta/dotfiles.git"


# Initialize
apt-get update
apt-get -y install vim git fish
chsh -s /usr/bin/fish


# Download
if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  mkdir ${DOT_DIRECTORY}

  git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi


## Deploy
cd ${DOT_DIRECTORY}

for f in .??*
do
  [ ${f} = ".git" ] && continue
  [ ${f} = ".gitignore" ] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)


# Start fish shell
exec fish
