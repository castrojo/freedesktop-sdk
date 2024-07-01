kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/texinfo.bst
  type: build

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
  url: ftp_gnu_org:ed/ed-1.20.2.tar.lz
  ref: 65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523
