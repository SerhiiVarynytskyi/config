#!/bin/sh

#echo "profile executed"

## if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#    . "$HOME/.bashrc"
#    fi
#fi
#
## set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi


config_dir="$HOME/.config/config_dir"

[ -d "$HOME/bin"                 ] && PATH="$PATH:$HOME/bin"
[ -d "$config_dir/bin"           ] && PATH="$PATH:$config_dir/bin"
[ -d "$HOME/.local/bin"          ] && PATH="$PATH:$HOME/.local/bin"
[ -d "$HOME/.cabal/bin"          ] && PATH="$PATH:$HOME/.cabal/bin"
[ -d "$HOME/.gem/ruby/2.0.0/bin" ] && PATH="$PATH:$HOME/.gem/ruby/2.0.0/bin"

[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"


######################
#
ANDROID=/Applications/android
ANDROID_HOME=$ANDROID/sdk
ANDROID_SDK=$ANDROID/sdk
ANDROID_NDK=$ANDROID/android-ndk-r10d

ANDROID_TOOLS=$ANDROID_SDK/tools
ANDROID_PLATFORM_TOOLS=$ANDROID_SDK/platform-tools


M2_HOME=/usr/local/apache-maven/apache-maven-3.1.1
M2=$M2_HOME/bin
M3_HOME=/usr/local/apache-maven/apache-maven-3.2.1
M3=$M3_HOME/bin
MAVEN_OPTS="-Xms256m -Xmx512m"


PATH="$PATH:$ANDROID_SDK:$ANDROID_NDK:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$M2"


# MacPorts Installer addition adding an appropriate PATH variable for use with MacPorts.
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"
# Finished adapting your PATH environment variable for use with MacPorts.

export LANG=ru_RU.UTF-8

export _JAVA_AWT_WM_NONREPARENTING=1

# vi: ft=sh