kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/libglib-testing.bst
- components/flatpak-minimal.bst
- components/appstream-minimal.bst

runtime-depends:
- components/pygobject.bst

depends:
- components/glib.bst
- components/dbus.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Dui=disabled

sources:
- kind: git_repo
  url: freedesktop:pwithnall/malcontent.git
  track: main
  ref: 0.11.1-0-g0979e6056745efe4bdfbcd1b31ef7546c367838f
