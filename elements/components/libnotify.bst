kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst
- components/gtk3.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/gdk-pixbuf.bst

variables:
  meson-local: >-
    -Ddocbook_docs=disabled
    -Dman=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnotify.so'

sources:
- kind: git_repo
  url: gnome:libnotify.git
  track: '*.*.*'
  ref: 0.8.3-0-g6083790f9e0f1827147ecd8799c4dced0e86a877
