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
  ref: v1.6.5-0-g5102eddff28d9b605f3e6783d50ad380f61f692e
