sx <https://github.com/Earnestly/sx>

# INTRODUCTION

  sx is a simple alternative to both `xinit(1)` and `startx(1)` for starting
  an Xorg server.

  It started life as a proof of concept while attempting to learn how both
  xinit and startx worked.

  It is not a direct replacement however as it provides a different, more
  limited, interface.

  Some of these major differences are listed here:

  * The server's command-line is hard coded and not exposed to the user.
  * The server starts on the same tty the user logged in on.
  * The server doesn't listen on anything except unix domain sockets.
  * The first `$DISPLAY` is 1 instead of 0 contrary to what `X(7)` suggests.
  * xauth entries are overwritten if the displayname is identical.
  * Corresponding xauth entries are unconditionally removed when the server exits.
  * The server uses the `-noreset` flag.
  * While XAUTHORITY is still honoured, `$XDG_CONFIG_HOME/sx/xauthfile` is\
    used instead of `$HOME/.Xauthority`
  * Very little proxy error checking is used preferring instead to let each tool speak for itself.
  * None of the typical `/etc/X11/xinit/` infrastructure is directly used.
  * Neither XINITRC is honoured nor `$HOME/.xinitrc` used.
  * The `$XDG_CONFIG_HOME/sx/sxrc` file is used instead of `$HOME/.xinitrc` and is\
    required to be executable.

  For a rational on why this exists, the author invites the reader to look
  over the source code for both xinit and startx.

## REQUIRES

  * Xorg
  * xauth
  * /dev/urandom

## INSTALL

  `make PREFIX=/usr DESTDIR=staged install`
