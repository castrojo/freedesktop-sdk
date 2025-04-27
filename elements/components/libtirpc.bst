kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  local_flags: -std=gnu17
  conf-local: >-
    --disable-gssapi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtirpc.so'

sources:
- kind: tar
  url: sourceforge:projects/libtirpc/files/libtirpc/1.3.4/libtirpc-1.3.4.tar.bz2
  ref: 1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860
