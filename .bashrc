# ____              _          _   _ _     _                   _     _               _              
#|  _ \  __ _ _ __ | | _____  | | | (_) __| | __ _ _   _  __ _| |_  | |__   __ _ ___| |__  _ __ ___ 
#| | | |/ _` | '_ \| |/ / _ \ | |_| | |/ _` |/ _` | | | |/ _` | __| | '_ \ / _` / __| '_ \| '__/ __|
#| |_| | (_| | | | |   <  __/ |  _  | | (_| | (_| | |_| | (_| | |_  | |_) | (_| \__ \ | | | | | (__ 
#|____/ \__,_|_| |_|_|\_\___| |_| |_|_|\__,_|\__,_|\__, |\__,_|\__| |_.__/ \__,_|___/_| |_|_|  \___|
#                                                  |___/                                            
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# #--Bash Theme--# #
#Magenta
#PS1="\[\033[0;35m\]\[$(tput bold)\][\[$(tput sgr0)\]\[\033[0;35m\]\u@\h:\W\[$(tput bold)\]]\[$(tput sgr0)\] "
#Light Magenta
PS1="\[\033[0;95m\]\[$(tput bold)\][\[$(tput sgr0)\]\[\033[0;95m\]\u@\h:\W\[$(tput bold)\]]\[$(tput sgr0)\] "

# Daily shortcuts.
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias news="newsboat"
alias email="neomutt"
alias files="ranger"
alias chat="weechat"
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

# Version control.
alias gs="git status"
alias gd="git add ."
alias gp="git push -u origin master"

# System maintenance & management.
alias cleancache="sudo pacman -Scc"
alias upgrade="sudo pacman -Syu"
alias sysupgrade="sudo pacman -Syuu"
alias install="sudo pacman -S"
alias remove="sudo pacman -R"

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias starwars="telnet towel.blinkenlights.nl"
alias myip="curl http://ipecho.net/plain; echo"

# Education
alias math="python"

# Entertainment
alias choo="sl"
alias matrix="cmatrix"

# Multiple commands

# Deploy your code straight into Git hosting site with. 
function lazygit() {
    git add .
    git commit -a -m "$1"
    git push -u origin master
}

alias="git add . && git commit -a -m '$i' && git push -u origin master"

# systemctl
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"
alias halt="sudo systemctl halt"
