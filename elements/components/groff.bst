kind: autotools

depends:
- bootstrap-import.bst
- components/perl.bst

build-depends:
- components/m4.bst
- components/texinfo.bst

config:
  build-commands:
    (<):
      # This is a workaround for a bug with parallel builds.
    - |
      cd "%{build-dir}"
      make -j1 arch/misc

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:groff/groff-1.23.0.tar.gz
  ref: 6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13
