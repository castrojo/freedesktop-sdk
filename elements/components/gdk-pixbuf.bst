kind: meson

build-depends:
- components/gobject-introspection.bst
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
    -Dandroid=disabled
    -Dgif=disabled
    -Djpeg=disabled
    -Dpng=disabled
    -Dtiff=disabled

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
  ref: 2.44.6-0-gcbbcb7f1b6334b5ca6c644aca2f0a8a0067aec58
