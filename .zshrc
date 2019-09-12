export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')" # $PATH Environment
export ZSH="$HOME/.local/share/oh-my-zsh" # Path to oh-my-zsh installation
export LANG=en_US.UTF-8


[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -Uz compinit promptinit
ZSH_THEME="eastwood"

source "$ZSH/oh-my-zsh.sh"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=( git )


# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# ibus-setup
#export QT4_IM_MODULE="ibus"
#export QT_IM_MODULE="ibus"
#export GTK_IM_MODULE="ibus"
#export XMODIFIERS="@im=ibus"
#export GTK_IM_MODULE_FILE="/usr/lib/gtk-3.0/3.0.0/immodules.cache"
