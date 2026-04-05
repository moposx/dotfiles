# Creates a directory and immediately changes into it
mkcd() {
    mkdir -p "$1" && cd "$1"
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
    bash -c "help "$@""
}

# change CWD to one of previous visited directory
autoload -Uz cdr

# run-help

help() {
    if ! whence run-help >/dev/null; then
        unalias run-help 2>/dev/null
        autoload -Uz run-help
    fi

    run-help "$@"
}

ssh() {
    unfunction ssh

    # Share SSH keys between Windows and WSL

    # Only applicable to WSL environment
    if ! grep -qi "wsl" /proc/version; then
        return
    fi

    # socat is required on WSL side
    command -v socat >/dev/null 2>&1 || {
        echo "Error: socat not installed." >&2
        return
    }

    SOCK="$HOME/.ssh/agent.sock"

    if ! ssh-add -l >/dev/null 2>&1; then
        rm -f "$SSH_AUTH_SOCK"

        (   
            setsid socat
            UNIX-LISTEN:$SSH_AUTH_SOCK,fork
            EXEC:"/mnt/c/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork
        ) &>/dev/null &

        for i in {1..20}; do
            [ -S "$SOCK" ] && break
            sleep 0.05
        done
    fi

    if [ -S "$SOCK" ]; then
        export SSH_AUTH_SOCK="$SOCK"
    fi

    ssh "$@"
}
