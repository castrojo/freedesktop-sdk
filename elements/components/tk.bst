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
  ref: core-8-6-16-0-gc9ca6b23f3afe49fbd1cb2b6ad36cfec3b8e329c
