#!/bin/bash

set -x
set -eo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PACKAGE_FILE=$SCRIPT_DIR/configurations/packages
SYMLINKS_FILE=$SCRIPT_DIR/configurations/symlinks

# Update
# Read packages and install line by line
while IFS= read -r package; do
	sudo pacman -Syu $package
done <"$PACKAGE_FILE"

# Run the cloning commands etc!
./configurations/githubrepos.sh

# Fix mimes (xdg-open) to the correct filetype
if (./configurations/filetypes.sh); then
	echo " "
	echo "Mimes OK"
	echo " "
else
	exit 1
fi

# Copy rc files
cp tmux/.tmux.conf ~/

# i3 folder
mkdir -p ~/.config/i3
cp i3/.i3status.conf ~/
cp i3/config ~/.config/i3/

# nvim folder
mkdir -p $HOME/config/nvim
cp $SCRIPT_DIR/nvim/* $HOME/.config/nvim/

# dunst folder
mkdir -p $HOME/.config/dunst
cp $SCRIPT_DIR/i3/.dunstrc $HOME/.config/dunst/

cp zsh/.zshrc ~/
cp zsh/.zsh_profile ~/

# Git config
git config --global core.editor "nvim"

mkdir -p ~/.virtualenv

eco ""
echo "Do the following manually!"
echo ""
echo "cd ~/.virtualenv"
echo "python3 -m venv neovim3"
echo "source neovim3/bin/activate"
echo "python3 -m pip install pynvim"
echo "deactivate"
