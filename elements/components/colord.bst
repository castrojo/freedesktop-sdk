kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/vala.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/lcms.bst
- components/libgudev.bst
- components/libgusb.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Dargyllcms_sensor=false
    -Dbash_completion=false
    -Dlibcolordcompat=false
    -Dman=false
    -Dvapi=true

sources:
- kind: git_repo
  url: github:hughsie/colord.git
  track: '*.*.*'
  ref: 1.4.7-0-g1f55f64bbcdbf2283fbf2b3eed3966893870285a
