# Enable Powerlevel10k instant prompt (keep this block at the top).
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration.
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git 
  web-search
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

# Source Oh My Zsh.
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export BAT_THEME=tokyonight_night
alias ls="eza --icons=always"        # Eza for better 'ls'
alias cd="z"                        # Zoxide for better 'cd'

# History setup.
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Completion using arrow keys.
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Zoxide (better cd)
eval "$(zoxide init zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Go PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
