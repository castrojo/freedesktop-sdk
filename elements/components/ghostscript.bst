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
  local_flags: -std=gnu17
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
  ref: ghostpdl-10.05.1-0-g7f64bc848f6b67ae204182e6e088eec110061490
