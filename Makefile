PREFIX = /usr/local
bindir = $(PREFIX)/bin
datarootdir = $(PREFIX)/share
mandir = $(datarootdir)/man

install: sx sx.1
	mkdir -p $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
	cp -f sx $(DESTDIR)$(bindir)
	cp -f sx.1 $(DESTDIR)$(mandir)/man1

uninstall:
	rm -f $(DESTDIR)$(bindir)/sx\
		$(DESTDIR)$(mandir)/man1/sx.1
