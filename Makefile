.POSIX:
.SUFFIXES:

PREFIX = /usr/local
bindir = $(PREFIX)/bin
datarootdir = $(PREFIX)/share
mandir = $(datarootdir)/man
man1dir = $(mandir)/man1

install: sx sx.1
	mkdir -p -- $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
	cp -f -- sx $(DESTDIR)$(bindir)/sx
	chmod -- +x $(DESTDIR)$(bindir)/sx
	cp -f -- sx.1 $(DESTDIR)$(man1dir)/sx.1
