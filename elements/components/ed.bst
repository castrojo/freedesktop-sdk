kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/texinfo.bst
  type: build

variables:
  conf-local: |
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS"

public:
  cpe:
    vendor: gnu

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:ed/ed-1.17.tar.lz
  ref: 71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54
