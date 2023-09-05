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
  url: ftp_gnu_org:bc/bc-1.07.1.tar.gz
  ref: 62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a
- kind: patch
  path: patches/bc/add-interpreter-to-script
