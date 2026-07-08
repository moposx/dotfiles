alias cp='command cp -iv'
alias ls='command ls --color=always'
alias mv='command mv -iv'
alias rm='command rm -iv'
alias md='command mkdir -pv'
alias mkdir='command mkdir -pv'
alias help='run-help'

if command -v eza &>/dev/null; then
    alias ls='eza --icons --color --git --group-directories-first --time-style=long-iso'
    alias l='ls'
    alias ll='ls -lgh'
    alias la='ls -lagh'
    alias lla='la'
    alias lt='ls --tree --level=2'
    alias ltt='ls --tree --level=3'
    alias lm='ls -lagh --sort=modified --reverse'
    alias lS='ls -lagh --sort=size --reverse'
fi
