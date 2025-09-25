kind: meson

build-depends:
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/python3-docutils.bst
- components/python3-gi-docgen.bst
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libglycin.bst
- components/shared-mime-info.bst

variables:
  meson-local: >
    -Dinstalled_tests=false
    -Dtests=false
    -Ddocumentation=true
    -Dman=true
    -Dandroid=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gdk-pixbuf-csource'
        - '%{bindir}/gdk-pixbuf-pixdata'
        - '%{bindir}/gdk-pixbuf-thumbnailer'
        - '%{libdir}/libgdk_pixbuf-2.0.so'

sources:
- kind: git_repo
  url: gnome:gdk-pixbuf.git
  track: 2.*[02468].*
  exclude:
  - '2.9*'
  ref: 2.44.2-0-gf964c322d7dfefc3f03e43c6ae3b35ecfe01721c
