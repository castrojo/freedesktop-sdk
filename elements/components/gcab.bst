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
  ref: v1.4-0-ge3f0c240eb1a1961f0ff61a83a2c7fafba95abb4
