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

export LIBVIRT_DEFAULT_URI='qemu:///system'

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
    export GTK_IM_MODULE=fcitx
    export QTK_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export LC_TIME=C.UTF-8
    export SSH_AUTH_SOCK="/run/user/$UID/openssh_agent"
    export _JAVA_AWT_WM_NONREPARENTING=1
    export VDPAU_DRIVER=radeonsi
    export XDG_CURRENT_DESKTOP=sway
    export QT_QPA_PLATFORMTHEME=qt5ct
    #"$HOME/dev/sway/build/sway/sway" -Dnoscanout -d > ~/.local/log/sway-"$(date +%Y-%m-%dT%H:%M:%S)".log 2>&1
    sway -Dnoscanout #-d > ~/.local/log/sway-"$(date +%Y-%m-%dT%H:%M:%S)".log 2>&1
    exec systemctl --user stop -- $(systemctl --user show -p Wants sway-session.target | cut -d= -f2)
fi
source "$HOME/.cargo/env"
