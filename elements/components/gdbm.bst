kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgdbm.so'

sources:
- kind: tar
  url: ftp_gnu_org:gdbm/gdbm-1.25.tar.gz
  ref: d02db3c5926ed877f8817b81cd1f92f53ef74ca8c6db543fbba0271b34f393ec
