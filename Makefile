PREFIX ?= /usr/local
MANDIR ?= $(PREFIX)/share/man

RONN ?= ronn
INSTALL ?= install

MAN_SOURCES := mount.gce-pd.8.ronn
MAN_OUTS := $(MAN_SOURCES:.ronn=)

.PHONY: all man clean install

all: man

clean:
	$(RM) $(MAN_OUTS)

man: $(MAN_OUTS)

install: install-man
	#$(INSTALL) -m 755 -g root -o root mount.gce-pd /sbin/mount.gce-pd

install-man: $(MAN_OUTS)
	$(INSTALL) -d $(MANDIR)/man8
	$(INSTALL) -m 644 *.8 $(MANDIR)/man8

%: %.ronn
	$(RONN) --pipe -r $< > $@
