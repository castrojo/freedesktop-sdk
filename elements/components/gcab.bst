kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/vala.bst

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcab-1.0.so'

variables:
  meson-local: -Ddocs=false

sources:
- kind: git_tag
  url: gnome:gcab.git
  track: master
  ref: v1.5-0-gd8054af4381dcef17ae691775c96a60116823047
