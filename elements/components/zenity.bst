kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/itstool.bst

depends:
- components/gtk3.bst

variables:
  meson-local: >-
    -Dlibnotify=false
    -Dwebkitgtk=false

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/help"

sources:
- kind: git_tag
  url: gnome:zenity.git
  track: zenity-3-44
  ref: 3.44.3-0-gc945c57c7df46a512173b8a725162700b2c442b1
