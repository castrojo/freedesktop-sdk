kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst
- components/xorg-font-util.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-proto-xorgproto.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/lib/libfontenc.git
  track: libfontenc-*
  ref: libfontenc-1.1.8-0-g92a85fda2acb4e14ec0b2f6d8fe3eaf2b687218c
