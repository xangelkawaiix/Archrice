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

_PROMPT() {
    _EXIT_STATUS=$?
    [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR=" \[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;9m\]$_EXIT_STATUS\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]"

	_BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! $_BRANCH == "" ]
	then
		_BRANCH_STR="[\[$(tput sgr0)\]\[\033[38;5;11m\]$_BRANCH\[$(tput sgr0)\]\[\033[38;5;7m\]]"
	else
		_BRANCH_STR=""
	fi
	
	PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]╺─╸\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]$_BRANCH_STR\[$(tput sgr0)\]\[\033[38;5;15m\] \n\[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\A\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]$_EXIT_STATUS_STR \[$(tput sgr0)\]\[\033[38;5;7m\]>>\[$(tput sgr0)\] "
  unset _EXIT_STATUS_STR
	unset _EXIT_STATUS
	unset _BRANCH_STR
	unset _BRANCH
}

PROMPT_COMMAND=_PROMPT

# Daily shortcuts.
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias news="newsboat"
alias email="neomutt"
alias files="ranger"
alias chat="irssi"
alias audio="alsamixer"
alias calendar="calcurse"

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
alias sw="sudo wifi-menu"
alias vbr="vim ~/.bashrc"
alias vic="vim ~/.config/i3/config"
alias vpc="vim ~/.config/polybar/config"
alias vrc="vim ~/.vimrc"

# Version control.
## TODO: Ordering the lists
alias gb="git branch"
alias gs="git status"
alias gd="git add ."
alias gp="git push -u origin master"
alias gc="git clone"
alias gp="git pull"
alias gpm="git pull origin master"
alias gck="git checkout"
alias gckm="git checkout master"
alias gi="git init"
alias gl="git log"
alias gls="git log --summary"
alias gbf="git branch -d" #delete the branch that is not used any more

# ls aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias lah="ls -lah"

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
alias wttr="curl http://wttr.in/"

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
    cp -r -f {.config/i3,.config/polybar,.config/neofetch,.config/moc,.config/dunst,.config/rofi,.config/rtv,.config/gtk-3.0} ~/Repos/Archrice/.config
    cp -r .ncmpcpp ~/Repos/Archrice/
    cp -r {.bashrc,.bash_profile,.Xdefaults,.xinitrc,.vimrc,.scripts} ~/Repos/Archrice/
    cd ~/Repos/Archrice
    git add .
    git commit -a -m "$1"
    git push -u origin master
    cd ~/
}

alias="git add . && git commit -a -m '$i' && git push -u origin master"

