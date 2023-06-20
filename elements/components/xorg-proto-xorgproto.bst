kind: meson
description: X.Org combined protocol headers

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:xorg/proto/xorgproto.git
  track: xorgproto-*
  exclude:
  - xorgproto-*.*.99.*
  ref: xorgproto-2023.2-0-g766967322209f2dcb72e6a8edea0c651f586201d
