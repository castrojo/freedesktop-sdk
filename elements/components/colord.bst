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
- kind: git_tag
  url: github:hughsie/colord.git
  track: main
  ref: 1.4.6-0-g43c19fd019da5f69d2ebc00a9908b1dd83129485
