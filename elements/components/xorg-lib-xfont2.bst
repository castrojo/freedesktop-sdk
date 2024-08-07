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
- kind: git_repo
  url: freedesktop:xorg/lib/libxfont.git
  track: libXfont2-*
  ref: libXfont2-2.0.7-0-g2c2e44c94ef17ecd5003a173237b57b315e28d93
