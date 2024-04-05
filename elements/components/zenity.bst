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
- kind: git_repo
  url: gnome:zenity.git
  track: '3.44.*'
  ref: 3.44.4-0-g50b7145b04cf5074363e24f1b7f6deebceeeb074
