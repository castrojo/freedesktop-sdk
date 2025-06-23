kind: meson_recc
description: X.org lib pciaccess

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/sed.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpciaccess.so'

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libpciaccess.git
  track: libpciaccess-*
  ref: libpciaccess-0.19-0-g38e6f15f839fba2c49982e7ad61cde681fd5d4d6
