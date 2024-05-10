kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/expat.bst
- components/freetype.bst
- components/libpaper.bst
- components/libpng.bst
- components/jpeg.bst
- components/lcms.bst
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
  url: ghostscript:ghostpdl.git
  track: ghostpdl-9.56.*
  exclude:
  - '*rc*'
  - '*test*'
  - '*release*'
  ref: ghostpdl-9.56.1-0-g1149c5ab914c7695caa8951bb8213f4241c51104
- kind: patch
  path: patches/ghostscript/autogen-Honour-NOCONFIGURE-1.patch
