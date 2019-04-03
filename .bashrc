if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

# Set up terminal
set -o emacs

# Not setting this causes vim errors with Unicode
export LANG=en_GB.UTF-8

# Some nice colours and a nice prompt
export CLICOLOR=cons25

# For `tree` etc.:
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35'

case "$TERM" in
    xterm-256color | xterm | screen-256color | screen)
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;'$COLOR_CODE'm\]\[\033[00m\]\[\033[0;34m\]\w\[\033[00m\]$ ⟩⟩⟩ '
        PS2='$((++PS_COUNT)) ⟩ '
        ;;
    *)
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        ;;
esac

# Set up commonly used applications
export EDITOR=nvim
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:l:pwd:exit:history'

# Import aliases etc.
for conf in ~/.config/shell/*.conf; do
    source "$conf"
done

# Collect remaining paths
if [ -d /etc/paths.d ]; then
    for file in /etc/paths.d/*; do
        paths="$(< "$file" tr '\n' ':' | sed 's/:$//')"
        if [[ "$PATH" == '' ]]; then
            PATH="$paths"
        else
            PATH="$PATH:$paths"
        fi
    done

    export PATH
fi

# Manual override
export PATH="$HOME/bin:$PATH"
