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
  ref: 1.9.2-0-g8aad9439c494957218dac9bdd78b8a298e18a7c9
