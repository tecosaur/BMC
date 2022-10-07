TEXMFDIR != kpsewhich -var-value=TEXMFHOME
BMCDIR := $(DESTDIR)$(TEXMFDIR)/tex/latex/bmc

SOURCES := $(wildcard *.sty) $(wildcard *.cls)

.PHONY: dummy
dummy:
	@printf 'Run `make -s install` to install BMC.\n'

.PHONY: install
install: $(SOURCES)
	@printf 'Copying files to %s...\n' '$(BMCDIR)'
	install -D -t $(BMCDIR) $(SOURCES)
	install -t $(BMCDIR) LICENCE
	@printf 'Done copying files. Run mktexlsr(1) to regenerate the TeX database.\n'
