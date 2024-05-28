kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make -f unix/Makefile prefix=%{prefix} "CFLAGS_NOOPT=-I. -DUNIX $CFLAGS" generic_gcc

  install-commands:
  - |
    install -m 755 -D -t "%{install-root}%{bindir}" zip zipcloak zipnote zipsplit
    install -m 644 -D -t "%{install-root}%{datadir}/man/man1" man/zip.1 man/zipcloak.1 man/zipnote.1 man/zipsplit.1

public:
  cpe:
    vendor: 'info-zip'
    version-match: 'zip(\d)(\d).tar.gz'

sources:
- kind: tar
  url: sourceforge_download:infozip/zip30.tar.gz
  ref: f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369
- kind: patch
  path: patches/zip/zip-gnu89-build.patch
