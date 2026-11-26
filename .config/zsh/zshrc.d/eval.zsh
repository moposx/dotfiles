# Mise goes first
command -v mise >/dev/null && eval "$(mise activate zsh)"

command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v direnv >/dev/null && eval "$(direnv hook zsh)"
