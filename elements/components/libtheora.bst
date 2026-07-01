# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/doxygen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libogg.bst
- components/libpng.bst
- components/cairo.bst

variables:
  conf-local: >-
    --disable-examples

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtheora.so'
        - '%{libdir}/libtheoraenc.so'
        - '%{libdir}/libtheoradec.so'

sources:
- kind: git_repo
  url: xiph:theora.git
  track: v*
  exclude:
  - '*alpha*'
  - '*beta*'
  ref: v1.2.0-0-g8e4808736e9c181b971306cc3f05df9e61354004
