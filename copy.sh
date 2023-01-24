#!/bin/bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Copy rc files
cp ~/.tmux.conf $SCRIPT_DIR/tmux/
cp ~/.i3status.conf $SCRIPT_DIR/i3/
cp ~/.zshrc $SCRIPT_DIR/zsh/
cp ~/.zsh_profile $SCRIPT_DIR/zsh/

# i3 folder
if [ -d "$HOME/.config/i3" ]; then
	echo "i3 config folder exists"
	cp ~/.config/i3/config $SCRIPT_DIR/i3/
fi

# nvim folder
if [ -d "$HOME/.config/nvim" ]; then
	echo "nvim folder exists"
	rsync -av --progress ~/.config/nvim $SCRIPT_DIR --exclude plugin --exclude node_modules --exclude undodir --exclude package.json --exclude package-lock.json 
fi
