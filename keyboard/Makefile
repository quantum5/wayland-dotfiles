XKBSYMBOLS=/usr/share/X11/xkb/symbols

.PHONY: install install-symbols install-ibus

install: install-symbols install-ibus

install-symbols:
	cp betterus.xkb $(XKBSYMBOLS)/betterus

install-ibus:
	patch /usr/share/ibus/component/simple.xml < ibus.diff
