# System
source /usr/share/cachyos-fish-config/cachyos-config.fish

# Env
set -gx EDITOR nvim
set -gx VISUAL nvim

# Node
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME
fish_add_path "$HOME/.local/share/npm-global/bin"

# Aliases
zoxide init fish --cmd cd | source

alias ls 'eza --group-directories-first'
alias ll 'eza -lh --group-directories-first --git'
alias la 'eza -lah --group-directories-first --git'
alias lt 'eza --tree --level=2 --group-directories-first'

set -gx BAT_THEME tokyonight_night
alias cat 'bat --paging=never --style=plain'

fzf --fish | source

# Go
fish_add_path /usr/local/go/bin

# Prompt
set -gx STARSHIP_CONFIG "$HOME/.config/starship.toml"
starship init fish | source
