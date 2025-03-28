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
  ref: 0.8.6-0-g131aad01ff5f563b4863becbb6ed84dac6e75d5a
