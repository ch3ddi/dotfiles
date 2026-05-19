
. "$HOME/.local/bin/env"
eval "$(starship init zsh)"

# Local overrides (secrets, machine-specific config) — not tracked in dotfiles
[ -f "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"

