# Generate static cache of plugins on demand

local plugins_list="$ZDOTDIR/.zsh_plugins.txt"
local plugins_static_cache_file="$HOME/.cache/zsh/.zsh_plugins.zsh"

if [[ ! -f "$plugins_static_cache_file" || "$plugins_list" -nt "$plugins_static_cache_file" ]]; then
    # At this time, `$HOME/.cache/zsh` may not exist yet
    command mkdir -p -- "${plugins_static_cache_file:h}"
    source "$ZDOTDIR/.antidote/antidote.zsh"
    antidote bundle <"$plugins_list" >"$plugins_static_cache_file"
fi

source "$plugins_static_cache_file"
