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
  ref: 0.8.2-0-g69aff6e5fa2842e00b409c348bd73188548828b3
