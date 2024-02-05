kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/xorg-util-macros.bst
- components/libxslt.bst
- components/python3.bst
- components/perl.bst

depends:
- bootstrap-import.bst
- components/xorg-app-xkbcomp.bst

variables:
  meson-local: >-
    -Dcompat-rules=true
    -Dxkb-base=/usr/share/X11/xkb
    -Dxorg-rules-symlinks=true

sources:
- kind: git_tag
  url: freedesktop:xkeyboard-config/xkeyboard-config.git
  track: master
  ref: xkeyboard-config-2.41-0-g2426c5997e9f76a45df2016d1092bff360712e70
