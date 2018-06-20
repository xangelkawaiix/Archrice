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

if [ -n "$SSH_CONNECTION" ]; then
export PS1="\[$(tput setaf 1)\]┌─╼ [$(tput setaf 7)\] \u \[$(tput setaf 1)\]╺─╸\[$(tput setaf 7)\] \H \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼ \[$(tput setaf 7)\][ssh]\"; else echo \"\[$(tput setaf 1)\]└╼ \[$(tput setaf 7)\][ssh]\"; fi) \[$(tput setaf 7)\]"
else
export PS1="\[$(tput setaf 1)\]┌─╼\[$(tput setaf 3)\] \u\[$(tput setaf 1)\] ╺─╸\[$(tput setaf 1)\] \H \[$(tput setaf 7)\][\[$(tput setaf 5)\]\w\[$(tput setaf 7)\]]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼\"; else echo \"\[$(tput setaf 1)\]└╼\"; fi) \[$(tput setaf 7)\]"
fi

#Generic shortcuts:
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias news="newsboat"
alias email="neomutt"
alias files="ranger"
alias chat="irssi"
alias audio="alsamixer"
alias calender="calcurse"

# Some aliases
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias gitup="git push origin master"
alias trem="transmission-remote"
alias mkd="mkdir -pv"

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias starwars="telnet towel.blinkenlights.nl"
alias myip="curl http://ipecho.net/plain; echo"

# Audio and Music
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"
