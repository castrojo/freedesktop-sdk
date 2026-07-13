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
  ref: xorgproto-2025.1-0-gc18d2bc22813793bba7f0e4e603c0104d7724802
