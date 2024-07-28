kind: manual

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblz4.so'

  cpe:
    vendor: lz4_project

sources:
- kind: git_repo
  url: github:lz4/lz4.git
  track: v*
  ref: v1.10.0-0-gebb370ca83af193212df4dcbadcc5d87bc0de2f0

config:

  build-commands:
  - make CFLAGS="${CFLAGS}" BUILD_STATIC=no

  install-commands:
  - make DESTDIR="%{install-root}" PREFIX="%{prefix}" LIBDIR="%{libdir}" BUILD_STATIC=no
    install

