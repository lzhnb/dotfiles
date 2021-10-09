# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set the xdg
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# runing zsh if zsh exists
if [ -f "$HOME/.local/bin/zsh" ]; then
	export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
    exec "$HOME/.local/bin/zsh"
elif [ -n "$BASH_VERSION" ]; then # if running bash
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    source "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/.local/bin:$PATH"


