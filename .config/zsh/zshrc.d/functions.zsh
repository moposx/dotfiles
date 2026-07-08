# Creates a directory and immediately changes into it
mkcd() {
    command mkdir -p "$1" && cd "$1"
}

# Helper to view Bash built-in documentation from Zsh
bhelp() {
    if [[ -z "$1" ]]; then
        echo "Usage: bhelp <bash-built-in>"
        return 1
    fi

    # Print the warning message
    print -P "%F{yellow}%BNOTE:%b The following output is from Bash's help system, not Zsh.%f"
    echo "------------------------------------------------------------"

    # Invoke bash to run the help built-in
    command bash -c 'help "$@"' bash "$@"
}

# change CWD to one of previous visited directory
autoload -Uz cdr

# Zsh run-help
unalias run-help 2>/dev/null && autoload -Uz run-help

ssh() {
    unfunction ssh

    # Share SSH keys between Windows and WSL

    # Only applicable to WSL environment
    if ! command grep -qi "wsl" /proc/version; then
        command ssh "$@"

        return
    fi

    # socat is required on WSL side
    command -v socat >/dev/null 2>&1 || {
        echo "Error: socat not installed." >&2
        command ssh "$@"

        return
    }

    # Ensure ~/.ssh directory exists with correct permissions
    if [[ ! -d "$HOME/.ssh" ]]; then
        command mkdir -m 0700 "$HOME/.ssh"
    fi

    local SOCK="$HOME/.ssh/agent.sock"
    local NPIPERELAY_BIN="/mnt/c/bin/npiperelay.exe"

    if [[ "$SSH_AUTH_SOCK" != "$SOCK" ]] || ! command pgrep -f "socat UNIX-LISTEN:$SOCK," >/dev/null || [[ ! -S "$SOCK" ]]; then

        # cleanup
        unset SSH_AUTH_SOCK
        command pkill -f "socat UNIX-LISTEN:$SOCK," >/dev/null 2>&1
        command rm -f "$SOCK"

        # launch socat via Zsh's disown
        (command socat UNIX-LISTEN:"$SOCK",fork EXEC:"$NPIPERELAY_BIN -ep -s //./pipe/openssh-ssh-agent",nofork &>/dev/null &!)

        # wait for socket
        for _ in {1..20}; do
            if [[ -S "$SOCK" ]] && command pgrep -f "socat UNIX-LISTEN:$SOCK," >/dev/null; then
                break
            fi
            command sleep 0.1
        done
    fi

    # socket's up, set $SSH_AUTH_SOCK
    if [[ -S "$SOCK" ]]; then
        export SSH_AUTH_SOCK="$SOCK"
    else
        echo "Error: Failed to establish SSH agent bridge." >&2
        unset SSH_AUTH_SOCK
    fi

    command ssh "$@"
}

