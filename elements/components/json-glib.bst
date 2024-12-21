kind: meson

build-depends:
- components/gobject-introspection.bst
- components/gtk-doc.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

config:
  install-commands:
    (>):
    - rm -r "%{install-root}%{libexecdir}/installed-tests"
    - rm -r "%{install-root}%{datadir}/installed-tests"

variables:
  meson-local: >-
    -Dgtk_doc=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjson-glib-1.0.so'

sources:
- kind: git_repo
  url: gnome:json-glib.git
  track: '*.*.*'
  ref: 1.10.6-0-gf2828132971ee7c2665ed53a5ac5029ffd6a8cea
