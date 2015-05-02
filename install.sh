#!/bin/sh

cd $(dirname "$0")

config_dir="${PWD##$HOME/}"
config_dir_prefix="" [ "$config_dir" != "$PWD" ] && config_dir_prefix="../"
config_backup_dir="backup-$(date +%F-%H-%M-%S)";


#-------------------------------------------------------------------------------
install_file() {
	if [ -e "$HOME/$2" ]; then
		if [ "$(readlink "$HOME/$2")" != "$config_dir/$1" ]; then
			mkdir -p "$config_backup_dir"
			mv "$HOME/$2" "$config_backup_dir/$1"
			echo "'$2' already exists. It is moved to '$config_dir/$config_backup_dir/$1'." 1>&2
		fi
	fi

	ln -fs "$config_dir/$1" "$HOME/$2"
}


#-------------------------------------------------------------------------------


# Make a symlink to the config dir at $HOME/.config/config_dir
if [ ! -e "$HOME/.config" ]; then
	mkdir "$HOME/.config"
elif [ ! -d "$HOME/.config" ]; then
	echo "$HOME/.config exists and is not a directory." 1>&2
fi;

if [ ! -e "$HOME/.config/config_dir" ]; then
	ln -s "$config_dir_prefix$config_dir" "$HOME/.config/config_dir"
elif [ "$(readlink "$HOME/.config/config_dir")" != "$config_dir_prefix$config_dir" ]; then
	echo "$HOME/.config/config_dir exists but is not the correct symlink. Please move or remove it." 1>&2
	exit 1
fi



## Install configuration files.
#for file in bash_profile bashrc gitconfig profile screenrc vimrc zshrc vim zprofile Xresources tmux.conf
#do
#	install_file "$file" ".$file"
#done

# Install bash configuration files.
install_file "bash/bash_profile" ".bash_profile"
install_file "bash/bash_login" ".bash_login"
install_file "bash/bashrc" ".bashrc"

install_file "profile" ".profile"
install_file "git/gitconfig" ".gitconfig"




## Check for required tools.
#check_commands() {
#	local missing=0
#	for tool in "$@"; do
#		if ! command -v "$tool" > /dev/null; then
#			echo "$tool missing."
#			missing=1
#		fi
#	done
#	return $missing
#}
#required_commands="git vim"
#if ! check_commands $required_commands; then
#	exit 1
#fi

## Install vundle.
#if [ ! -d "vim/bundle/vundle" ]; then
#	mkdir -p "vim/bundle"
#	git clone https://github.com/gmarik/vundle.git "vim/bundle/vundle"
#fi
#vim +PluginClean +PluginUpdate +qall
#
## Install zsh-syntax-highlighting.
#if [ ! -d "zsh-syntax-highlighting" ]; then
#	git clone git://github.com/zsh-users/zsh-syntax-highlighting
#fi