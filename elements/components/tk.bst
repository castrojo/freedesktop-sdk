kind: autotools
description: TK

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/tcl.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xscrnsaver.bst

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
  track: core-*
  exclude:
  - "*-a*"
  - "*-b*"
  - "*-rc*"
  ref: core-9-0-1-0-g2f59c02d24ca9d3c953d943858532eac4e628c86
