# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
  ref: xorgproto-2026.1-0-g6d3907b6d5dc4aa7d7ee6ee5d7d8714e7466630b
