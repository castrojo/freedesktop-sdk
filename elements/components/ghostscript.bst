# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cups.bst
- components/expat.bst
- components/freetype.bst
- components/jpeg.bst
- components/lcms.bst
- components/libpaper.bst
- components/libpng.bst
- components/libtiff.bst
- components/openjpeg.bst
- components/xorg-lib-xt.bst

variables:
  conf-local: >-
    --with-drivers=ALL
    --with-system-libtiff=yes
    --with-local-zlib=no

config:
  configure-commands:
    (<):
    - rm -r expat jpeg libpng openjpeg

sources:
- kind: git_repo
  url: github:ArtifexSoftware/ghostpdl.git
  track: ghostpdl-*
  exclude:
  - '*rc*'
  - '*test*'
  ref: ghostpdl-10.08.0-0-g05631c2cba4e578fdd6bd25cae6f0939436de848
