# Command History Related
setopt EXTENDED_HISTORY     # Save timestamp and duration of commands to the history file
setopt APPEND_HISTORY       # Append new commands to the history file instead of overwriting it
setopt INC_APPEND_HISTORY   # Write commands to the history file immediately after execution
setopt SHARE_HISTORY        # Share history between all active Zsh sessions in real-time
setopt HIST_IGNORE_DUPS     # Do not record the command to the history file if it's a duplicate
setopt HIST_IGNORE_ALL_DUPS # If a new command is a duplicate, remove the older entry from history
setopt HIST_SAVE_NO_DUPS    # Do not write duplicate commands to the history file
setopt HIST_FIND_NO_DUPS    # Do not display a line previously found during a search
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from each command line added to history
setopt HIST_IGNORE_SPACE    # Do not record commands that start with a space
setopt HIST_NO_STORE        # Remove the 'history' and 'fc' commands themselves from the history list
setopt HIST_VERIFY          # Don't execute immediate history expansions; let the user edit them first

# Navigation
setopt AUTO_CD           # Change directory without the need of `cd`
setopt AUTO_PUSHD        # Push visited directories onto the directory stack (accessible via `cd -` or `cd -N`)
setopt PUSHD_IGNORE_DUPS # Do not push dulicate directories onto the directory stack

# Advanced
setopt EXTENDED_GLOB        # Enable extended globbing behavior
setopt NOMATCH              # Print an error message if a globbing pattern has no matches
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell sessions
unsetopt BEEP               # Disable the bell
unsetopt CORRECT            # Do not correct misspelled commands
