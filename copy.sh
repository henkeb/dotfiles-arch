#!/bin/bash
set -x
set -eo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Copy rc files
cp ~/.tmux.conf $SCRIPT_DIR/tmux/
cp ~/.i3status.conf $SCRIPT_DIR/i3/
cp ~/.zshrc $SCRIPT_DIR/zsh/
cp ~/.zsh_profile $SCRIPT_DIR/zsh/
cp ~/.zsh_history $SCRIPT_DIR/zsh/
cp ~/.alacritty.yml $SCRIPT_DIR/configurations/
cp ~/.config/dunst/dunstrc $SCRIPT_DIR/i3/

# i3 folder
if [ -d "$HOME/.config/i3" ]; then
	cp ~/.config/i3/config $SCRIPT_DIR/i3/
else
	echo "Could not find i3 folder!!!"
fi

# nvim folder
if [ -d "$HOME/.config/nvim" ]; then
	rsync -av --progress ~/.config/nvim $SCRIPT_DIR --exclude plugin --exclude node_modules --exclude undodir --exclude package.json --exclude package-lock.json
else
	echo "Could not find nvim folder!!!"
fi
