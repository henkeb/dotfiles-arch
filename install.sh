#!/bin/bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PACKAGE_FILE=$SCRIPT_DIR/configurations/packages
SYMLINKS_FILE=$SCRIPT_DIR/configurations/symlinks

# Update
if ( sudo apt update ); then
	echo " "
	echo "Update done"
	echo " "
	else
		exit 1
fi

# Read packages and install line by line
while IFS= read -r package
do
  sudo apt install -y $package
done < "$PACKAGE_FILE"

# fix symlinks to installed packages
mkdir -p ~/.local/bin

while IFS= read -r symlinks
do
  $symlinks
done < "$SYMLINKS_FILE"


# Run the cloning commands etc!
./configurations/githubrepos.sh

# Fix mimes (xdg-open) to the correct filetype
if ( ./configurations/filetypes.sh ); then
	echo " "
	echo "Mimes OK"
	echo " "
else
	exit 1
fi

# Copy rc files
cp tmux/.tmux.conf ~/

# i3 folder
if [ -d "$HOME/.config/i3" ]; then
	echo "i3 config folder exists"
else
	mkdir -p ~/.config/i3
fi

# nvim folder
if [ -d "$HOME/.config/nvim" ]; then
	echo "nvim folder exists"
	cp $SCRIPT_DIR/nvim/* $HOME/.config/nvim/
else
	mkdir -p $HOME/config/nvim
	cp $SCRIPT_DIR/nvim/* $HOME/.config/nvim/
fi

cp i3/.i3status.conf ~/
cp i3/config ~/.config/i3/
cp zsh/.zshrc ~/
cp zsh/.zsh_profile ~/

# Git config
git config --global core.editor "nvim"

mkdir -p ~/.virtualenv
cd ~/.virtualenv
python3 -m venv neovim3
source neovim3/bin/activate
python3 -m pip install pynvim
deactivate
