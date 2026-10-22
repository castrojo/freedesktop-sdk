# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/libxslt.bst
- components/perl.bst
- components/python3.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-app-xkbcomp.bst

variables:
  license-element-name: xorg-data-xkeyboard-config
  meson-local: >-
    -Dcompat-rules=true
    -Dxorg-rules-symlinks=true

sources:
- kind: git_repo
  url: freedesktop:xkeyboard-config/xkeyboard-config.git
  track: xkeyboard-config-*
  ref: xkeyboard-config-2.49-0-g2ec770a0085bf776de749e185ca40e50213fb21f
