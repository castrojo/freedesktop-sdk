kind: autotools
description: TCL

depends:
- bootstrap-import.bst

variables:
  conf-cmd: ./unix/configure
  conf-local: |
    --disable-rpath

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/tcl*/tclAppInit.c'
      static-blocklist:
        (>):
        - '%{libdir}/libtclstub*.a'
        - '%{libdir}/itcl*/libitclstub*.a'
        - '%{libdir}/tdbc*/libtdbcstub*.a'

config:
  install-commands:
    (>):
    - sed -i "s|%{build-root}/%{build-dir}|%{includedir}/tcl-private|" %{install-root}%{libdir}/tclConfig.sh
    - sed -i "s|%{build-root}|%{includedir}/tcl-private|" %{install-root}%{libdir}/tclConfig.sh
    - mkdir -p "%{install-root}%{includedir}/tcl-private/doc/"
    - cp "%{build-root}/doc/man.macros" "%{install-root}%{includedir}/tcl-private/doc/"

    # The below file overlaps with a man page from perl.
    - rm "%{install-root}%{mandir}/man3/Thread.3"

sources:
- kind: tar
  url: sourceforge_download:tcl/tcl8.6.14-src.tar.gz
  ref: 5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66
