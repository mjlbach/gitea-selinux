TARGETS ?= gitea-sshd
MODULES ?= ${TARGETS:=.pp.bz2}
# DATADIR seems to be the more commonly used variable
# Point SHAREDIR to DATADIR by default to not break existing users
DATADIR ?= /usr/share
SHAREDIR ?= ${DATADIR}

all: ${TARGETS:=.pp.bz2}

%.pp.bz2: %.pp
	@echo Compressing $^ -\> $@
	bzip2 -f -9 $^

%.pp: %.te
	make -f ${SHAREDIR}/selinux/devel/Makefile $@

clean:
	rm -f *~  *.tc *.pp *.pp.bz2
	rm -rf tmp *.tar.gz

man: install-policy
	sepolicy manpage --path . --domain ${TARGETS}_t

install-policy: all
	semodule -i ${TARGETS}.pp.bz2

install: man
	install -D -pm 644 ${TARGETS}.pp.bz2 ${DESTDIR}${SHAREDIR}/selinux/packages/sshd-gitea.pp.bz2
	install -D -pm 644 container.if ${DESTDIR}${SHAREDIR}/selinux/devel/include/services/sshd-gitea.if

# vim: set noexpandtab shiftwidth=8 softtabstop=0
