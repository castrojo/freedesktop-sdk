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
  ref: xorgproto-2022.2-0-g824001c947cb1962209c6a8f2c63c2637877220d
