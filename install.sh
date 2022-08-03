#!/bin/sh
echo "make sure installed git, zsh, neovim and curl. Type (yes,no):"
read installedornot
if ((installedornot == "yes")); then
	echo "do you want to replace the zshrc. Type (yes,no):"
	read notnewzsh
	if ((notnewzsh == "yes")); then
		chsh -s /bin/zsh
		cp .zshrc ~/
	else
		echo "alias vim='nvim'" > ~/.zshrc
	fi
	

	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	mkdir -p ~/.config/nvim/
	cp init.vim ~/.config/nvim/
	nvim -c :PlugInstall
else if ((installedornot == "no")); then
	echo "installed it first"	
fi
