kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/freetype.bst
- components/xorg-lib-fontenc.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxfont.git
  track: libXfont2-*
  ref: libXfont2-2.0.7-0-g2c2e44c94ef17ecd5003a173237b57b315e28d93
