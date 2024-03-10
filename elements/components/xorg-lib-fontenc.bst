kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-proto-xorgproto.bst
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/xorg-font-util.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libfontenc.git
  track: master
  ref: libfontenc-1.1.8-0-g92a85fda2acb4e14ec0b2f6d8fe3eaf2b687218c
