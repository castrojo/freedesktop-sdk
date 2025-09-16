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
  ref: 1.10.8-0-g8273a7d2539c115c0eb1bcc9e8cd9d26fcde204a
