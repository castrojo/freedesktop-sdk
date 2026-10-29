# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libpng.bst
- components/zlib.bst

variables:
  build-dir: ''

sources:
- kind: git_repo
  url: github:michaelrsweet/pdfio.git
  track: v*.*.*
  ref: v1.6.6-0-gfb05e16bb2ae8cf1b1101669b236401dcb36c906
