# === System ===
source /usr/share/cachyos-fish-config/cachyos-config.fish

# === Env ===
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PNPM_HOME "/home/stratomaster/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

set -gx PATH "$HOME/.local/share/npm-global/bin" $PATH

# === Aliases ===
zoxide init fish --cmd cd | source

alias ls 'eza --icons --group-directories-first'
alias ll 'eza -lh --icons --group-directories-first --git'
alias la 'eza -lah --icons --group-directories-first --git'
alias lt 'eza --tree --level=2 --icons --group-directories-first'

set -gx BAT_THEME tokyonight_night
alias cat 'bat --paging=never --style=plain'

fzf --fish | source

# === Go ===
fish_add_path /usr/local/go/bin

# === Prompt ===
set -gx STARSHIP_CONFIG "$HOME/.config/starship.toml"
starship init fish | source
