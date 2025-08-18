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
    - sed -i "s|%{build-root}/%{build-dir}|%{includedir}/tk-private|" 
      %{install-root}%{libdir}/tkConfig.sh
    - sed -i "s|%{build-root}|%{includedir}/tk-private|" 
      %{install-root}%{libdir}/tkConfig.sh
    - mkdir -p "%{install-root}%{includedir}/tk-private/doc/"
    - cp "%{build-root}/doc/man.macros" 
      "%{install-root}%{includedir}/tk-private/doc/"
    - |
      cd "%{install-root}/%{bindir}"
      wish_versioned="$(ls wish8.* 2>/dev/null | grep -E '^wish8\.[0-9]+' | head -n 1)"
      test -f "$wish_versioned" && ln -svf "$wish_versioned" wish

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/tk*/tkAppInit.c'
      static-blocklist:
        (>):
        - "%{libdir}/libtkstub*.a"

  cpe:
    version-match: '(\d+)-(\d)+-(\d+)'


sources:
- kind: git_repo
  url: github:tcltk/tk.git
  track: core-8-6-*
  exclude:
  - "*-a*"
  - "*-b*"
  - "*-rc*"
  ref: core-8-6-17-0-gafdf30259d05840a4e513bae638955902322d1ec
