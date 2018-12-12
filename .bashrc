# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # Allows you to cd into directory merely by typing the directory name.

HISTSIZE= HISTFILESIZE= # infinite history.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

export GPG_TTY=$(tty)
# Create directory and cd into it
function md {
    if [ ! -n "$1" ]; then
     echo "Enter a directory name"
    elif [ -d $1 ]; then
     echo "\`$1' already exists"
    else
     mkdir $1 && cd $1
    fi
}

# Create new vimwiki notes
function vn() {
    NOTE_DIR=~/vimwiki/Notes
    NOTE_NAME="$1"
    TIMESTAMP="$(date +%Y-%m-%d_%H.%M)"
    vim "${NOTE_DIR}/${TIMESTAMP}-${NOTE_NAME}.wiki"
}

shdl() { curl -O $(curl -s https://www.sci-hub.tw/"$@" | grep location.href | grep -o https.*pdf) ; } # Download article from sci-hub

# System maintenance
alias mw="~/.config/mutt/mutt-wizard.sh"
alias nf="clear && neofetch"
alias sdn="shutdown -h now"
alias refpg="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Some aliases.
alias p="sudo pacman"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias x="extract"
alias c="compile"
alias cfv="vim ~/.vimrc"
alias cfx="vim ~/.Xdefaults"
alias cfb="vim ~/.bashrc"
alias cff="vim ~/.config/i3/config"
alias cfp="vim ~/.config/polybar/config"

# Tex
alias Txa="cp ~/Templates/latex-templates/article.tex"
alias Txs="cp ~/Templates/latex-templates/beamer.tex"
alias Txh="cp ~/Templates/latex-templates/handout.tex"

# Directory shortcut
alias gd="cd ~/Documents"
alias gm="cd ~/Music"
alias gp="cd ~/Pictures"
alias gv="cd ~/Videos"
alias gs="cd ~/Documents/School/H.S/X/"

# Git version control.
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
alias ccat="highlight --out-format=ansi" # Color cat - Print file with syntax highlighting

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer" # Watch YouTube videos
alias starwars="telnet towel.blinkenlights.nl" # Watch Star Wars in ASCII
alias myip="curl http://ipecho.net/plain; echo"
alias wttr="curl http://wttr.in/" # Weather forecast
alias lk="youtube-dl -ic --add-metadata https://youtube.com/c/LukeSmithxyz" # Update luke's videos

# Development
alias live="python3 -m http.server" # Local live server
