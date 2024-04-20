kind: make

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    BINDIR='%{bindir}'
    SBINDIR='%{bindir}'
    SHAREDIR='%{datadir}'
    MANDIR='%{mandir}'
    INCLUDEDIR='%{includedir}'
    ETCDIR='%{sysconfdir}'
    LIBDIR='%{libdir}'
    NO_ARLIB=1
    BUILDDATE=$(date -u +%F -d @$SOURCE_DATE_EPOCH)
  make: make %{make-args}
  make-install: make -j1 install %{make-args} DESTDIR='%{install-root}'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libkeyutils.so'

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/dhowells/keyutils.git
  track: v*
  ref: v1.6.3-0-gcb3bb194cca88211cbfcdde2f10c0f43c3fb8ec3
