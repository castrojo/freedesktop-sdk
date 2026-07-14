# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/flatpak.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/gettext.bst
- components/gobject-introspection.bst
- components/python3-pyparsing.bst

depends:
- public-stacks/runtime-minimal.bst
- components/appstream-minimal.bst
- components/bubblewrap.bst
- components/curl.bst
- components/fuse3.bst
- components/gpgme.bst
- components/json-glib.bst
- components/libarchive.bst
- components/libseccomp.bst
- components/ostree-minimal.bst
- components/xdg-dbus-proxy.bst

variables:
  meson-local: >-
    -Dgtkdoc=disabled
    -Dsystem_helper=disabled
    -Dxauth=disabled
    -Dsystem_bubblewrap=bwrap
    -Ddconf=disabled
    -Dmalcontent=disabled
    -Dselinux_module=disabled
    -Dman=disabled
    -Ddocbook_docs=disabled
    -Dtests=false
    -Dsystem_dbus_proxy=xdg-dbus-proxy
    -Dwayland_security_context=disabled
    -Dsystemd=disabled
