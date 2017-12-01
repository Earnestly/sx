PREFIX ?= /usr/local
bindir ?= /bin
mandir ?= /share/man

install: sx sx.1
	install -Dm0755 sx $(DESTDIR)$(PREFIX)$(bindir)/sx
	install -Dm0644 sx.1 $(DESTDIR)$(PREFIX)$(mandir)/man1/sx.1

.PHONY: install
