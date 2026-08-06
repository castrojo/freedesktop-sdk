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
  ref: libXfont2-2.0.9-0-g975cc6526e892c6fad8fa49d0fef58565fbaa003
