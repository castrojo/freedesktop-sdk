kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/docbook-xsl.bst
- components/gettext.bst
- components/gobject-introspection.bst
- components/libxslt.bst
- components/python3-pyparsing.bst
- components/wayland-protocols.bst
- components/xmlto.bst

depends:
- bootstrap-import.bst
- components/bubblewrap.bst
- components/gpgme.bst
- components/libarchive.bst
- components/libxml2.bst
- components/curl.bst
- components/xorg-lib-xau.bst
- components/ostree.bst
- components/fuse3.bst
- components/json-glib.bst
- components/appstream.bst
- components/libseccomp.bst
- components/polkit.bst
- components/xdg-dbus-proxy.bst


variables:
  meson-local: >-
    -Dgtkdoc=disabled
    -Dsystem_bubblewrap=bwrap
    -Dhttp_backend=curl
    -Ddconf=disabled
    -Dmalcontent=disabled
    -Dselinux_module=disabled
    -Dtests=false
    -Dsystem_dbus_proxy=xdg-dbus-proxy

(@):
- elements/include/flatpak.yml
