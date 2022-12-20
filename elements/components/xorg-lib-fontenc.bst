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
- kind: git_repo
  url: freedesktop:xorg/lib/libfontenc.git
  track: libfontenc-*
  ref: libfontenc-1.1.7-0-g68300c3452592a9e7bf60b4edb008785c4c891c4
