kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-util-macros.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: freedesktop:xorg/font/util.git
  track: font-util-*
  ref: font-util-1.4.1-0-gb5ca142f81a6f14eddb23be050291d1c25514777
