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
  ref: libfontenc-1.1.10-0-geb42c925cab00d235b05e649eb4fb4a1858b67b9
