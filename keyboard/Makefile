XKBSYMBOLS=/usr/share/X11/xkb/symbols

.PHONY: install install-symbols install-ibus install-extra-fn

install: install-symbols install-ibus

install-extra-fn:
	patch /usr/share/X11/xkb/symbols/inet < extra-fn.patch

install-symbols:
	cp betterus.xkb $(XKBSYMBOLS)/betterus

install-ibus:
	if patch --dry-run --reverse --force /usr/share/ibus/component/simple.xml < ibus.diff >/dev/null 2>&1; then \
		echo 'iBus already patched'; \
	else \
		patch --no-backup-if-mismatch --forward -r - /usr/share/ibus/component/simple.xml < ibus.diff; \
	fi
