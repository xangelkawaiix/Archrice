# ____              _          _   _ _     _                   _     _               _              
#|  _ \  __ _ _ __ | | _____  | | | (_) __| | __ _ _   _  __ _| |_  | |__   __ _ ___| |__  _ __ ___ 
#| | | |/ _` | '_ \| |/ / _ \ | |_| | |/ _` |/ _` | | | |/ _` | __| | '_ \ / _` / __| '_ \| '__/ __|
#| |_| | (_| | | | |   <  __/ |  _  | | (_| | (_| | |_| | (_| | |_  | |_) | (_| \__ \ | | | | | (__ 
#|____/ \__,_|_| |_|_|\_\___| |_| |_|_|\__,_|\__,_|\__, |\__,_|\__| |_.__/ \__,_|___/_| |_|_|  \___|
#                                                  |___/                                            
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

# Daily shortcuts.
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias news="newsboat"
alias email="neomutt"
alias files="ranger"
alias chat="irssi"
alias audio="alsamixer"
alias calender="calcurse"

# Some aliases.
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias bw="wal -i"
alias sw="sudo wifi-menu"
alias vb="vim ~/.bashrc"
alias vc="vim ~/.config/i3/config"
alias vp="vim ~/.config/polybar/config"

# Version control.
alias gs="git status"
alias gd="git add ."
alias gp="git push -u origin master"

# ls aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# System maintenance & management.
alias cln="sudo pacman -Scc"
alias upgr="sudo pacman -Syu"
alias sysupgr="sudo pacman -Syuu"
alias inst="sudo pacman -S"
alias rmv="sudo pacman -R"
alias nf="clear && neofetch"
alias sdn="sudo shutdown -h now"

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias starwars="telnet towel.blinkenlights.nl"
alias myip="curl http://ipecho.net/plain; echo"

# Development
alias live="python3 -m http.server"

# #-- Multiple commands--# #

# Push your code straight into Github. 
function gt() {
    git add .
    git commit -a -m "$1"
    git push -u origin master
}

# Copying specific config folder into Archrice repo folder, and then push it into Github.

function rice(){
    cp -r -f {.config/i3,.config/polybar,.config/mpd,.config/neofetch,.config/moc,.config/dunst,.config/rofi,.config/rtv} ~/Repos/Archrice/.config
    cp -r {.ncmpcpp,.newsboat} ~/Repos/Archrice/
    cp {.bashrc,.bash_profile,.Xdefaults,.vimrc} ~/Repos/Archrice/
    cd ~/Repos/Archrice
    git add .
    git commit -a -m "$1"
    git push -u origin master
}

alias="git add . && git commit -a -m '$i' && git push -u origin master"
