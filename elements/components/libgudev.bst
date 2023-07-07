kind: meson

build-depends:
- bootstrap-import.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/vala.bst
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- components/util-linux.bst
- components/systemd-libs.bst

# umockdev depends on vala and is recursively dependent on libgudev.
# Only useful for testing.
variables:
  meson-local: >-
    -Dtests=disabled
    -Dvapi=enabled
    -Dintrospection=enabled

sources:
- kind: git_repo
  url: gnome:libgudev.git
  track: '[0-9]*'
  ref: 238-0-gdf7c9c9940160307aaeb31347f4776a46f8736a9
