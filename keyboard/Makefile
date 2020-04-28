XKBSYMBOLS=/usr/share/X11/xkb/symbols
XKBCOMPOSE=/usr/share/X11/locale/en_US.UTF-8/Compose

.PHONY: install install-symbols install-compose

install: install-symbols install-compose

install-symbols:
	cp betterus.xkb $(XKBSYMBOLS)/betterus

install-compose:
	(sed "/# BEGIN Quantum's BetterUS Layout/,/# END Quantum's BetterUS Layout/d" $(XKBCOMPOSE); cat betterus.compose) > Compose
	cp Compose $(XKBCOMPOSE)
