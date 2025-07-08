kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ed.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:bc/bc-1.08.2.tar.gz
  ref: ae470fec429775653e042015edc928d07c8c3b2fc59765172a330d3d87785f86
