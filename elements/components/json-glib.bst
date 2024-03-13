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
- kind: git_tag
  url: gnome:json-glib.git
  track: json-glib-1-6
  ref: 1.6.6-0-g3cf2b53667a73376c852e08dcadd197a5f8325b9
