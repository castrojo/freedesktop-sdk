# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/python*/site-packages/*/include'
        - '%{indep-libdir}/python*/site-packages/*/include/**'

sources:
- kind: git_repo
  url: github:pygobject/pycairo.git
  track: v*
  ref-format: git-describe
  ref: v1.29.0-0-gf2c40870be2d5e9d15ecee339e1d5e30d82c7959
