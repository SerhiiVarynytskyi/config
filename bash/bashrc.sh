#!/bin/sh

#echo "bashrc executed"

source "$HOME/.config/config_dir/shellrc.sh"

config_dir="$HOME/.config/config_dir"


shopt -s checkwinsize
shopt -s histappend
export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTIGNORE="ls:ps:pwd:history"
export HISTFILE=$config_dir/tmp/.bash_history

PROMPT_COMMAND='history -a'

#-------------------------------------------------
black='a'
red='b'
green='c'
brown='d'
blue='e'
magenta='f'
cyan='g'
light_grey='h'
bold_black='A'
bold_red='B'
bold_green='C'
yellow='D'
bold_blue='E'
bold_magenta='F'
bold_cyan='G'
bold_light_grey='H'
default='x'
#-------------------------------------------------
xx00="$bold_blue$default"  # directory
xx01="$cyan$default"       # symbolic link
xx02="$magenta$default"    # socket
xx03="$magenta$default"    # pipe
xx04="$green$default"      # executable
xx05="$yellow$default"     # block special
xx06="$brown$default"      # character special
xx07="$bold_green$green"   # executable with setuid bit set
xx08="$bold_green$default" # executable with setgid bit set
xx09="$bold_blue$blue"     # directory writable to others, with sticky bit
xx10="$bold_blue$blue"     # directory writable to others, without sticky bit
#-------------------------------------------------
LSCOLORS="$xx00$xx01$xx02$xx03$xx04$xx05$xx06$xx07$xx08$xx09$xx10"
export LSCOLORS
CLICOLOR="YES"
export CLICOLOR
#-------------------------------------------------
#-------------------------------------------------
#-------------------------------------------------
#-------------------------------------------------






#PS1='\t\[[\e[0;31m\]\u\[\e[m\]|\[\e[1;34m\]\w\[\e[m\] ] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;37m\] '
#PS1='\t[\w]$ '
PS1='[\W]$ '
