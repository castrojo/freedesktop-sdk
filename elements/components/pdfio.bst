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
  ref: v1.6.4-0-g48b185c650e2e732eed260d63909f4ec68ac9353
