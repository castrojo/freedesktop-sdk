kind: meson
description: X.Org combined protocol headers


build-depends:
- public-stacks/buildsystem-meson.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/proto/xorgproto.git
  track: xorgproto-*
  exclude:
  - xorgproto-*.*.99.*
  ref: xorgproto-2024.1-0-g67469711055522b8adb2d795b01e7ba98cb8816c
