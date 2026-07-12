kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst
- components/freetype.bst
- components/xorg-lib-fontenc.bst

environment:
  PYTHON: ""

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libxfont.git
  track: libXfont2-*
  ref: libXfont2-2.0.8-0-g88b9df882c0ea91d7bb468aa4792ef1b6f13aa9d
