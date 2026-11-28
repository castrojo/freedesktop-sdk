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
  ref: v1.6.7-0-gbb3cd8915ab460c052b32d9f8ac6f13aef37ec81
