kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst
- components/gtk3.bst

depends:
- public-stacks/runtime-minimal.bst
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

  cpe:
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:libnotify.git
  track: '*.*.*'
  ref: 0.8.7-0-g1d9767a392cbac7e899e7ab80235cfceebd52731
