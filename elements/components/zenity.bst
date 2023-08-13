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
  ref: 3.44.2-real-0-ge9a591aa1d182e220013d9ab50dcc7607734d7b1
