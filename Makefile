PREFIX = /usr/local
bindir = /bin
mandir = /share/man

install: sx sx.1
	mkdir -p $(DESTDIR)$(PREFIX)$(bindir)
	mkdir -p $(DESTDIR)$(PREFIX)$(mandir)/man1
	cp -f sx $(DESTDIR)$(PREFIX)$(bindir)
	cp -f sx.1 $(DESTDIR)$(PREFIX)$(mandir)/man1
