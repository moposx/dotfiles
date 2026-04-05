# Command History
HISTFILE="$ZDOTDIR/.zsh_history"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000

# Language and locale
export LANGUAGE=en
export LANG=en_US.UTF-8

# Default editor
export EDITOR="nvim"

# Appeareance
export LS_COLORS="di=01;36:ex=01;32:"

# OMZ
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Rust
export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"

# Opam
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" >/dev/null  2>/dev/null

# PATH
typeset -gU path PATH # deduplicate PATH entries

path=(
    $HOME/bin(N-/)
    $HOME/go/bin(N-/)
    $HOME/.local/bin(N-/)
    $HOME/.local/share/mise/shims(N-/)
    $HOME/.local/share/fnm/aliases/default(N-/)
    $HOME/.local/share/cargo/bin(N-/)
    $path
)

export PATH
