kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: |
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS"

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  cpe:
    vendor: gnu

sources:
- kind: tar
  url: ftp_gnu_org:ed/ed-1.21.tar.lz
  ref: 60e24998727d453a5cf02c54664b97536de46a2b34cd1f4f67c1c1a61bbbad75
