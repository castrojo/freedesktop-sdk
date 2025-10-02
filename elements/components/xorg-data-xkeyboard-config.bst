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
  license-element-name: xorg-data-xkeyboard-config
  meson-local: >-
    -Dcompat-rules=true
    -Dxkb-base=/usr/share/X11/xkb
    -Dxorg-rules-symlinks=true

sources:
- kind: git_repo
  url: freedesktop:xkeyboard-config/xkeyboard-config.git
  track: xkeyboard-config-*
  ref: xkeyboard-config-2.46-0-g4225e14a2d0fca5a4f9cb8517cf12d96ea290d84
