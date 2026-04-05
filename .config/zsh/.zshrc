# Load Antidote
source $ZDOTDIR/.antidote/antidote.zsh

# Be careful: the order of loading matters.
_modules=(
    "options.zsh"
    "env.zsh"
    "eval.zsh"
    "functions.zsh"
    "plugins.zsh"
    "aliases.zsh"
    "keybindings.zsh"
    "completion.zsh"
    "prompt.zsh"
)

for module in "$ZDOTDIR/zshrc.d"/${^~_modules}; do
    source "$module"
done

unset _modules
