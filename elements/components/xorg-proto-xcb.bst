kind: autotools-recc
description: X.org proto xcb

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/python3-minimal.bst
- components/xorg-util-macros.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/proto/xcbproto.git
  track: xcb-proto-*
  ref: xcb-proto-1.17.0-0-g77d7fc04da729ddc5ed4aacf30253726fac24dca
