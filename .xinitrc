#!/usr/bin/env sh
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec i3

xset r rate 200 50
