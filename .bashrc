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

# System maintenance
alias mw="~/.config/mutt/mutt-wizard.sh"
alias nf="clear && neofetch"
alias sdn="sudo shutdown -h now"
alias refpg="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Some aliases.
alias p="sudo pacman"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias X="extract"
alias c="compile"
alias vrc="vim ~/.vimrc"
alias cvb="vim ~/.bashrc"
alias cif="vim ~/.config/i3/config"

# Tex
alias Txa="cp ~/Templates/latex-templates/article.tex"
alias Txs="cp ~/Templates/latex-templates/beamer.tex"
alias Txh="cp ~/Templates/latex-templates/handout.tex"

# FastDir
alias gd="cd ~/Documents"
alias gm="cd ~/Music"
alias gp="cd ~/Pictures"
alias gv="cd ~/Videos"
alias gs="cd ~/Documents/School/H.S/X/"


# Version control.
alias gc="git checkout -b" # Create new local branch
alias gl="git log --summary"
alias gD="git branch -d" # Delete the branch

# ls aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias lah="ls -lah"

# Adding color
alias ls="ls -hN --color=auto --group-directories-first"
alias ggrep="grep --color=auto" # Color grep - Highlight desired sequence
alias ccat="highlight --out-format=ansi" # Color cat - Print file with syntax highlighting | highlight package need to be installed

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias starwars="telnet towel.blinkenlights.nl"
alias myip="curl http://ipecho.net/plain; echo"
alias wttr="curl http://wttr.in/"
alias lk="youtube-dl -ic --add-metadata https://youtube.com/c/LukeSmithxyz"

# Development
alias live="python3 -m http.server"

# Push code straight into Github. 
function gitp() {
    git add .
    git commit -a -m "$1"
    git push -u origin master
}

function mc {
    if [ ! -n "$1" ]; then
     echo "Enter a directory name"
    elif [ -d $1 ]; then
     echo "\`$1' already exists"
    else
     mkdir $1 && cd $1
    fi
}

alias="git add . && git commit -a -m '$i' && git push -u origin master"

shdl() { curl -O $(curl -s https://www.sci-hub.tw/"$@" | grep location.href | grep -o https.*pdf) ; } # Download article from sci-hub
