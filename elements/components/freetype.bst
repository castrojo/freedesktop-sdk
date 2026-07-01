# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/freetype.yml

build-depends:
- components/_private/freetype-stage1.bst
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/brotli.bst
- components/libpng.bst
- components/harfbuzz.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfreetype.so'

  cpe:
    product: 'freetype2'
    vendor: 'freetype'

variables:
  meson-local: >-
    -Dbrotli=enabled
    -Dbzip2=enabled
    -Dharfbuzz=enabled
    -Dpng=enabled
    -Dzlib=enabled
