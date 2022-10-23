kind: manual

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblz4.so'

sources:
- kind: git_tag
  url: github:lz4/lz4.git
  track: dev
  track-extra:
  - release
  ref: v1.9.4-0-g5ff839680134437dbf4678f3d0c7b371d84f4964

config:

  build-commands:
  - make CFLAGS="${CFLAGS}" BUILD_STATIC=no

  install-commands:
  - make DESTDIR="%{install-root}" PREFIX="%{prefix}" LIBDIR="%{libdir}" BUILD_STATIC=no
    install

