DESTDIR ?=
PREFIX = /usr
BINDIR = $(PREFIX)/bin
SBINDIR = $(PREFIX)/sbin
MANDIR = $(PREFIX)/share/man

INSTALL = install

.PHONY: all
all:

.PHONY: install
install:
	$(INSTALL) -d -m0755 $(DESTDIR)$(BINDIR)
	$(INSTALL) -d -m0755 $(DESTDIR)$(SBINDIR)
	$(INSTALL) -d -m0755 $(DESTDIR)$(MANDIR)/man1
	$(INSTALL) -d -m0755 $(DESTDIR)$(MANDIR)/man8
	$(INSTALL) -m0755 -uroot -groot renew-certificates $(DESTDIR)$(SBINDIR)
	$(INSTALL) -m0755 -uroot -groot notify-expiring-certificates $(DESTDIR)$(BINDIR)
