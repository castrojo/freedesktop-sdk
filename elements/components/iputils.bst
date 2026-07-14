# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst

depends:
- components/libcap.bst

variables:
  meson-local: >-
    -DBUILD_MANS=false
    -DSKIP_TESTS=true

sources:
- kind: git_repo
  url: github:iputils/iputils.git
  track: '[0-9]*'
  ref: 20250605-0-g6e1cb146547eb6fbb127ffc8397a9241be0d33c2
