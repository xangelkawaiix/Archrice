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

HISTSIZE= HISTFILESIZE=

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

# Some aliases.
alias mw="~/.config/mutt/mutt-wizard.sh"
alias nn="systemctl restart NetworkManager"
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias vb="vim ~/.bashrc"
alias vi="vim ~/.config/i3/config"
alias vp="vim ~/.config/polybar/config"
alias vr="vim ~/.vimrc"
alias vx="vim ~/.Xdefaults"
alias extract="bash ~/.scripts/extract"

# FastDir
alias gD="cd ~/Documents"
alias gM="cd ~/Music"
alias gP="cd ~/Pictures"
alias gV="cd ~/Video"

# Version control.
alias gb="git branch"
alias gcb="git checkout -b" # Create new local branch
alias ga="git add ."
alias gs="git status"
alias gpm="git push -u origin master"
alias gcl="git clone"
alias gp="git pull"
alias gc="git checkout"
alias gi="git init"
alias gl="git log"
alias gls="git log --summary"
alias gbd="git branch -d" # Delete the branch that is not used any more

# ls aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias lah="ls -lah"

# System maintenance
alias cln="sudo pacman -Scc"
alias upgr="sudo pacman -Syu"
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
alias wttr="curl http://wttr.in/"

# Development
alias live="python3 -m http.server"

# #-- Function --# #

# Push your code straight into Github. 
function gt() {
    git add .
    git commit -a -m "$1"
    git push -u origin master
}

alias="git add . && git commit -a -m '$i' && git push -u origin master"
