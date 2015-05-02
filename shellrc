#!/bin/sh

#echo "shellrc executed"

config_dir="$HOME/.config/config_dir"

# Source a file if it exists.
function try_source {
	[ -f "$1" ] && source "$1"
}

# Test if a command exists.
function test_command {
	command -v "$1" > /dev/null
}

# Extra Useful Functions
function file_composition {
  find . -type f | perl -n -e'/(\.\w+$)/ && print "$1\n"' | sort | uniq -c | sort -n
}

git_pretty_log() {
  git log --graph --decorate --pretty="tformat:${FORMAT}" $* |
  less -FXRS
}

try_source "$config_dir/git/git-completion.sh"
try_source "$config_dir/git/git-prompt.sh"
try_source "$config_dir/aliases"



# Enable viewing non-text files in less.
test_command lesspipe && eval "$(SHELL=/bin/sh lesspipe)"

# Create a directory and change to it.
function mkd {
	if [ $# -gt 1 ]; then
		echo "Usage: $0 [dir]" >&2
		return 13
	fi
	if [ -z $1 ]; then
		mkd "/tmp/$(date +%F-%H-%M-%S)"
	else
		mkdir -p "$1"
		cd "$1"
	fi
}

# Get the directory name of a path.
# Behaves exactly like dirname with no options.
function dname {
	# Empty input means current directory.
	local p=${1:-.}
	# Strip trailing slash.
	p="${p%/}"
	# Remove last component.
	dir="${p%/*}"

	# If nothing is left, it's the root directory.
	if [ -z "$dir" ]; then
		echo '/'
	# If nothing changed there was no slash, so the CWD is the directory.
	elif [ "$dir" = "$p" ]; then
		echo '.'
	# Otherwise $dir holds the directory name.
	else
		echo "$dir"
	fi
}

export TTY="$(tty)"
export TTY_HOST="$(who -m | awk '$NF ~ /\(.*\)/ { if ("/dev/" $2 == ENVIRON["TTY"]) { sub(/^\(/, "", $5); sub(/\)$/, "", $5); print $5; exit 0; } }')"
export TTY_USER="$(ls -l "$TTY" | awk '{ print $3; exit 0; }')"

# Set up git PS1 configuration.
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"

export EDITOR=nano
export PAGER=less
export MANPAGER=vimpager

