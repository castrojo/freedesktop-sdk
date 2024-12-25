kind: autotools
description: TCL

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-cmd: ./unix/configure
  arch-conf: ''
  (?):
  - target_arch == "i686":
      arch-conf: --disable-64bit
  - target_arch != "i686":
      arch-conf: --enable-64bit
  conf-local: >-
    --disable-rpath
    --disable-zipfs
    %{arch-conf}

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
  url: sourceforge_download:tcl/tcl9.0.1-src.tar.gz
  ref: a72b1607d7a399c75148c80fcdead88ed3371a29884181f200f2200cdee33bbc
