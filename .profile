# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export GTK_IM_MODULE=fcitx5
    export QTK_IM_MODULE=fcitx5
    export XMODIFIERS=@im=fcitx5
    export LC_TIME=C.UTF-8
    export SSH_AUTH_SOCK="/run/user/$UID/openssh_agent"
    export _JAVA_AWT_WM_NONREPARENTING=1
    export WLR_NO_HARDWARE_CURSORS=1
    exec sway > ~/.local/log/sway-"$(date +%Y-%m-%dT%H:%M:%S)".log 2>&1
fi
