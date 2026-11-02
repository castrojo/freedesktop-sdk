# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/jpeg.bst
- components/libtiff.bst

variables:
  conf-local: >-
    --with-threads
    --with-tiff
    --with-jpeg

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblcms2.so'
  cpe:
    product: little_cms_color_engine

sources:
- kind: git_repo
  url: github:mm2/Little-CMS.git
  track: lcms2.*
  exclude:
  - lcms2.*rc*
  ref: lcms2.20-0-g7717fce0d85447ef3b2df0cca2e99207c15eeecd
