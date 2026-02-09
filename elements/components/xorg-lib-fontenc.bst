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
  ref: libfontenc-1.1.9-0-g780d1f6f192a331de7b298a96e23ebc44d2a884b
