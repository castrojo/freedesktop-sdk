kind: meson
description: X.Org combined protocol headers

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/proto/xorgproto.git
  track: master
  exclude:
  - xorgproto-*.*.99.*
  ref: xorgproto-2023.1-0-g16ca6a5c5963e41f15e8415453f6b33d02ec44bd
