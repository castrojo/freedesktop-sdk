kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/gettext.bst
- components/gobject-introspection.bst
- components/python3-pyparsing.bst

depends:
- bootstrap-import.bst
- components/bubblewrap.bst
- components/gpgme.bst
- components/libarchive.bst
- components/curl.bst
- components/ostree-minimal.bst
- components/fuse3.bst
- components/json-glib.bst
- components/appstream-minimal.bst
- components/libseccomp.bst
- components/xdg-dbus-proxy.bst

variables:
  meson-local: >-
    -Dgtkdoc=disabled
    -Dsystem_helper=disabled
    -Dxauth=disabled
    -Dsystem_bubblewrap=bwrap
    -Dhttp_backend=curl
    -Ddconf=disabled
    -Dmalcontent=disabled
    -Dselinux_module=disabled
    -Dman=disabled
    -Ddocbook_docs=disabled
    -Dtests=false
    -Dsystem_dbus_proxy=xdg-dbus-proxy
    -Dwayland_security_context=disabled

(@):
- elements/include/flatpak.yml
