kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:xorg/font/util.git
  track: font-util-*
  ref: font-util-1.4.1-0-gb5ca142f81a6f14eddb23be050291d1c25514777
