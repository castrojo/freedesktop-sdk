kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/xorg-util-macros.bst
- components/libxslt.bst
- components/python3.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-app-xkbcomp.bst

variables:
  meson-local: >-
    -Dcompat-rules=true
    -Dxkb-base=/usr/share/X11/xkb
    -Dxorg-rules-symlinks=true

sources:
- kind: git_repo
  url: freedesktop:xkeyboard-config/xkeyboard-config.git
  track: xkeyboard-config-*
  ref: xkeyboard-config-2.44-0-g1691aef8fa12f63037f2ff956f902587d814a65c
