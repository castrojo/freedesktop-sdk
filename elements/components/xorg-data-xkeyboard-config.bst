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
- kind: git_repo
  url: freedesktop:xkeyboard-config/xkeyboard-config.git
  track: xkeyboard-config-*
  ref: xkeyboard-config-2.40-0-g5ff20c6a2f905a4d2af714e7394d2b93551b9b17
