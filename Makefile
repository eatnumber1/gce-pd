PREFIX ?= /usr/local
MANDIR ?= $(PREFIX)/share/man

RONN ?= ronn
INSTALL ?= install

MAN_SOURCES := mount.gce-pd.8.ronn
MAN_OUTS := $(MAN_SOURCES:.ronn=)
MAN_HTML := $(MAN_SOURCES:.ronn=.html)

.PHONY: all man clean install html

all: man

clean:
	$(RM) $(MAN_OUTS) $(MAN_HTML)

man: $(MAN_OUTS)

install: install-man
	$(INSTALL) -m 755 -g root -o root mount.gce-pd /sbin/mount.gce-pd

html: $(MAN_HTML)

install-man: $(MAN_OUTS)
	$(INSTALL) -d $(MANDIR)/man8
	$(INSTALL) -m 644 *.8 $(MANDIR)/man8

%: %.ronn
	$(RONN) --pipe -r $< > $@

%.html: %.ronn index.txt
	$(RONN) --pipe --style print -5 $< > $@
