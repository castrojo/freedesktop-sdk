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
  track: ghostpdl-*
  exclude:
  - '*rc*'
  - '*test*'
  ref: ghostpdl-10.01.2-0-g06ba66167b2566ff75ee8486f2ee201e3817f891
