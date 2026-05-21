kind: filter
description: |
  util-linux libraries used in operating system images.

  Libraries which are useful inside container runtimes are in the
  `components/util-linux-libs.bst` element.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- components/util-linux-manifest.bst
- public-stacks/runtime-minimal.bst

config:
  include:
  - libfdisk

public:
  bst:
    split-rules:
      devel:
        (>):
          - '%{libdir}/libfdisk.so'
