kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
- filename: components/texinfo.bst
  type: build

config:
  build-commands:
    (<):
      # This is a workaround for a bug with parallel builds.
    - |
      make -j1 arch/misc

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:groff/groff-1.22.4.tar.gz
  ref: e78e7b4cb7dec310849004fa88847c44701e8d133b5d4c13057d876c1bad0293
