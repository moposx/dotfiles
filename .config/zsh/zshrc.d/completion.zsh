# Enable completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' list-colors "${(s.:.)LS_COLORS}" "ma=1;7"
zstyle ':completion:*' matcher-list 'm:{a-z0-9}={A-Z0-0}'                  # ignore case
zstyle ':completion:*' list-grouping 'yes'                                 # group candidates visually
zstyle ':completion:*' group-name ''                                       # Group by type
zstyle ':completion:*:descriptions' format '%B%F{4}-- %d --%f%b'           # Style headers
zstyle ':completion:*:descriptions' format '%B%F{4}-- %d --%f%b'           # Style messages
zstyle ':completion:*:warnings' format '%B%F{1}-- no matches found --%f%b' # Style warnings

zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo' # ez-compinit completion style
