# ~/.config/fish/config.fish
# Fish + Starship + zoxide + fzf | CachyOS

# System (CachyOS defaults)
source /usr/share/cachyos-fish-config/cachyos-config.fish

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Go
fish_add_path /usr/local/go/bin

# zoxide (smart cd)
zoxide init fish --cmd cd | source

# eza (modern ls)
alias ls 'eza --group-directories-first'
alias ll 'eza -lh --group-directories-first --git'
alias la 'eza -lah --group-directories-first --git'
alias lt 'eza --tree --level=2 --group-directories-first'

# bat (modern cat)
set -gx BAT_THEME tokyonight_night
alias cat 'bat --paging=never --style=plain'

# fzf keybindings + completion
fzf --fish | source

# Starship prompt
set -gx STARSHIP_CONFIG "$HOME/.config/starship.toml"
starship init fish | source
