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
  ref: libfontenc-1.1.6-0-gc8f8ce35a5eafe8ca0d1ed3dfdd098fe0943b99c
