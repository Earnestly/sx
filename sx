#!/bin/sh --
# sx - start an xorg server
# requires xauth Xorg /dev/urandom

cleanup() {
    if [ "$server" ] && kill -0 "$server" 2> /dev/null; then
        kill "$server"
        wait "$server"
        xorg=$?
    fi

    if ! stty "$stty"; then
        stty sane
    fi

    xauth remove :"$tty"
}

stty=$(stty -g)
tty=$(tty)
tty=${tty#/dev/tty}

cfgdir=${XDG_CONFIG_HOME:-$HOME/.config}/sx
datadir=${XDG_DATA_HOME:-$HOME/.local/share}/sx
mkdir -p -- "$cfgdir" "$datadir"

export XAUTHORITY="${XAUTHORITY:-$datadir/xauthority}"
touch -- "$XAUTHORITY"

trap 'cleanup; trap "" EXIT; trap - INT; kill -s INT "$$"' INT
trap 'cleanup; trap "" EXIT; exit "${xorg:-0}"' EXIT HUP TERM QUIT

# Xorg will return a USR1 signal to the parent process indicating it is ready
# to accept connections if it inherited a USR1 signal with a SIG_IGN
# disposition.  Consequently a client may be started directly from a USR1
# signal handler and obviate the need to poll for server readiness.
trap 'DISPLAY=:$tty "${@:-$cfgdir/sxrc}" & wait "$!"' USR1

xauth add :"$tty" MIT-MAGIC-COOKIE-1 "$(od -An -N16 -tx /dev/urandom | tr -d ' ')"
(trap '' USR1 && exec Xorg :"$tty" vt"$tty" -keeptty -noreset -auth "$XAUTHORITY") &
server=$!
wait "$server"
