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
- kind: git_repo
  url: github:rhboot/efivar.git
  track: '[0-9]*'
  ref: 39-0-gc47820c37ac26286559ec004de07d48d05f3308c
- kind: patch_queue
  path: patches/efivar
