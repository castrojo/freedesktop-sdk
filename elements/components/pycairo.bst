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
  ref: v1.29.2-0-g5617d48b204e817779c259d958470527f034cb96
