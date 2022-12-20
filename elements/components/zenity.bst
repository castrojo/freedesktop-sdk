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
  track: '*.*.*'
  ref: 3.44.0-0-g7bf8c8910d34bfb2b883b32118b93b68d44dd77b
