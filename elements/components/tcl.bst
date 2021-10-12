kind: autotools
description: TCL

depends:
- filename: bootstrap-import.bst

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

config:
  install-commands:
    (>):
    - sed -i "s|%{build-root}/%{builddir}|%{includedir}/tcl-private|" %{install-root}%{libdir}/tclConfig.sh
    - sed -i "s|%{build-root}|%{includedir}/tcl-private|" %{install-root}%{libdir}/tclConfig.sh
    - mkdir -p "%{install-root}%{includedir}/tcl-private/doc/"
    - cp "%{build-root}/doc/man.macros" "%{install-root}%{includedir}/tcl-private/doc/"

sources:
- kind: tar
  url: sourceforge_download:tcl/tcl8.6.10-src.tar.gz
  ref: 5196dbf6638e3df8d5c87b5815c8c2b758496eb6f0e41446596c9a4e638d87ed
