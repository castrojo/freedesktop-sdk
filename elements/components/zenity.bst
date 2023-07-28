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
  ref: 3.44.1-0-g5cb56e3e87dcbb1fb423ecee436a62bde483b611
