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
  ref: xkeyboard-config-2.43-0-g4c6d0d21dfb2f1423282edc806d89b22fba4375c
