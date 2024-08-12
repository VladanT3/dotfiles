# Setting the directiry for the zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it doesnt exist
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Adding zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions on startup
autoload -U compinit && compinit

# Optimizes loading completions i think
zinit cdreplay -q

# Oh-My-Posh initialization
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/custom.toml)"

# Keybind for accepting auto-suggestion
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^p' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion config
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
alias ls='ls -a --color'

# Some extra PATH stuff from .bashrc just in case
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
. "$HOME/.cargo/env"
