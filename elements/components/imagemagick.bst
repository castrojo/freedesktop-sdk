# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/bzip2.bst
- components/freetype.bst
- components/jpeg.bst
- components/lcms.bst
- components/libpng.bst
- components/libtiff.bst
- components/libwebp.bst
- components/zlib.bst

sources:
- kind: git_repo
  url: github:ImageMagick/ImageMagick.git
  track: '7.*'
  ref-format: git-describe
  ref: 7.1.2-30-0-ga7f1a869255b2540518b2c979a228d7cf48cdc76
