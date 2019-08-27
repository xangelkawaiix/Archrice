# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/danke/.oh-my-zsh"

# ibus-setup
export QT4_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE_FILE="/usr/lib/gtk-3.0/3.0.0/immodules.cache"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export LANG=en_US.UTF-8
autoload -Uz compinit promptinit
compinit
promptinit

ZSH_THEME="cypher"

# Uncomment the following line to automatically update without prompting.
 DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
	git
)

source "$ZSH/oh-my-zsh.sh"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
