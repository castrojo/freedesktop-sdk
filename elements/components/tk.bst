kind: autotools
description: TK

depends:
- bootstrap-import.bst
- components/tcl.bst
- components/xorg-lib-x11.bst

variables:
  conf-cmd: ./unix/configure
  conf-local: |
    --disable-rpath

config:
  install-commands:
    (>):
    - sed -i "s|%{build-root}/%{build-dir}|%{includedir}/tk-private|" %{install-root}%{libdir}/tkConfig.sh
    - sed -i "s|%{build-root}|%{includedir}/tk-private|" %{install-root}%{libdir}/tkConfig.sh
    - mkdir -p "%{install-root}%{includedir}/tk-private/doc/"
    - cp "%{build-root}/doc/man.macros" "%{install-root}%{includedir}/tk-private/doc/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/tk*/tkAppInit.c'
      static-blocklist:
        (>):
        - "%{libdir}/libtkstub*.a"


sources:
- kind: git_repo
  url: github:tcltk/tk.git
  track: core-8-6-*
  exclude:
  - "*-a*"
  - "*-b*"
  - "*-rc*"
  ref: core-8-6-16-0-g2436f584c36d57411f6632e50eb3050097e011d0
