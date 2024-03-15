kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  config: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    BINDIR="%{bindir}"
    INCDIR="%{includedir}"
    MANDIR="%{mandir}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgif.so'

config:
  build-commands:
  - |
    make %{config}

  install-commands:
  - |
    make install %{config} DESTDIR="%{install-root}"

  - |
    rm "%{install-root}%{libdir}/libgif.a"

sources:
- kind: tar
  url: sourceforge_download:giflib/giflib-5.2.2.tar.gz
  ref: be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb
- kind: patch
  path: patches/giflib/no-imagemagick.patch
