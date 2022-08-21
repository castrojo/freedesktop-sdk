kind: make

build-depends:
- components/mandoc.bst

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    PREFIX='%{prefix}'
    EXEC_PREFIX='%{exec_prefix}'
    LIBDIR='%{libdir}'
    MANDIR='%{mandir}'
    INCLUDEDIR='%{includedir}'
    BINDIR='%{bindir}'

  make: make %{make-args}
  make-install: make -j1 DESTDIR='%{install-root}' %{make-args} install

sources:
- kind: git_tag
  url: github:rhboot/efivar.git
  track: main
  ref: 38-0-g1753149d4176ebfb2b135ac0aaf79340bf0e7a93
- kind: patch_queue
  path: patches/efivar
