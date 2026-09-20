# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Ddocs=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfribidi.so'

sources:
- kind: git_repo
  url: github:fribidi/fribidi.git
  track: v*.*.*
  ref: v1.0.17-0-gb93119f5fdc7ea47672cc304c1455ffa6dfe7536
