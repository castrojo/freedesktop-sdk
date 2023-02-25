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
- kind: git_tag
  url: github:lz4/lz4.git
  ref: v1.9.3-0-gd44371841a2f1728a3f36839fd4b7e872d0927d3

config:

  build-commands:
  - make CFLAGS="${CFLAGS}" BUILD_STATIC=no

  install-commands:
  - make DESTDIR="%{install-root}" PREFIX="%{prefix}" LIBDIR="%{libdir}" BUILD_STATIC=no
    install

