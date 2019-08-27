#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
shopt -s cdspell # Auto correct cd
shopt -s checkwinsize # Check window on resize

HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1=" \[\e[00;34m\]λ \W \[\e[0m\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Bash auto-completion feature
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# adds autoomplete to commands that dont work
if [ "$PS1" ]; then
	complete -cf sudo man
fi
