VERSION = 1.1

DESTDIR ?=
PREFIX = /usr
BINDIR = $(PREFIX)/bin
SBINDIR = $(PREFIX)/sbin
MANDIR = $(PREFIX)/share/man

INSTALL = install


.PHONY: all
all:


.PHONY: disttar
disttar:
	tar -vzcf dogtag-auxutils-$(VERSION).tar.gz \
		--transform='s,^,dogtag-auxutils-$(VERSION)/,' \
		Makefile \
		README* LICENSE TODO \
		notify-expiring-certificates \
		notify-expiring-certificates.1 \
		renew-certificates \
		renew-certificates.8


.PHONY: install
install:
	$(INSTALL) -d -m0755 $(DESTDIR)$(BINDIR)
	$(INSTALL) -d -m0755 $(DESTDIR)$(SBINDIR)
	$(INSTALL) -d -m0755 $(DESTDIR)$(MANDIR)/man1
	$(INSTALL) -d -m0755 $(DESTDIR)$(MANDIR)/man8
	$(INSTALL) -m0755 renew-certificates $(DESTDIR)$(SBINDIR)
	$(INSTALL) -m0755 notify-expiring-certificates $(DESTDIR)$(BINDIR)
	$(INSTALL) -m0644 renew-certificates.8 $(DESTDIR)$(MANDIR)/man8
	$(INSTALL) -m0644 notify-expiring-certificates.1 $(DESTDIR)$(MANDIR)/man1
