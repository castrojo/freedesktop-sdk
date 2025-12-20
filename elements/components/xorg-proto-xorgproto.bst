kind: autotools
description: X.Org combined protocol headers


build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-minimal.bst
- components/xorg-util-macros.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/proto/xorgproto.git
  track: xorgproto-*
  exclude:
  - xorgproto-*.*.99.*
  ref: xorgproto-2025.1-0-gc18d2bc22813793bba7f0e4e603c0104d7724802
