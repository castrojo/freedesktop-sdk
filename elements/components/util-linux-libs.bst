kind: filter
description: |
  Core util-linux libraries.

  Libraries which are useful only in operating systems are in the separate
  `components/util-linux-libs-full.bst` element.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- components/libeconf.bst
- components/util-linux-manifest.bst
- public-stacks/runtime-minimal.bst

config:
  include:
  - libblkid
  - liblastlog2
  - libmount
  - libsmartcols
  - libuuid

public:
  bst:
    split-rules:
      devel:
        (>):
          - '%{libdir}/libblkid.so'
          - '%{libdir}/liblastlog2.so'
          - '%{libdir}/libmount.so'
          - '%{libdir}/libsmartcols.so'
          - '%{libdir}/libuuid.so'
