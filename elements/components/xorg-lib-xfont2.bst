kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/freetype.bst
- filename: components/xorg-lib-fontenc.bst
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxfont.git
  track: master
  ref: libXfont2-2.0.6-0-gd54aaf2483df6a1f98fadc09004157e657b7f73e
