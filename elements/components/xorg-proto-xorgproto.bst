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
  ref: xorgproto-2024.1-0-g67469711055522b8adb2d795b01e7ba98cb8816c
