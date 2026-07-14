# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/freetype.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/freetype-stage1.bst

depends:
- public-stacks/runtime-minimal.bst
- components/brotli.bst
- components/harfbuzz.bst
- components/libpng.bst

variables:
  meson-local: >-
    -Dbrotli=enabled
    -Dbzip2=enabled
    -Dharfbuzz=enabled
    -Dpng=enabled
    -Dzlib=enabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfreetype.so'

  cpe:
    product: 'freetype2'
    vendor: 'freetype'
