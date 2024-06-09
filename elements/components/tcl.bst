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
  url: sourceforge_download:tcl/tcl8.6.13-src.tar.gz
  ref: 43a1fae7412f61ff11de2cfd05d28cfc3a73762f354a417c62370a54e2caf066
