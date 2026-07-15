# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/flatpak.yml

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
- public-stacks/runtime-minimal.bst
- components/appstream.bst
- components/bubblewrap.bst
- components/curl.bst
- components/fuse3.bst
- components/gpgme.bst
- components/json-glib.bst
- components/libarchive.bst
- components/libseccomp.bst
- components/libxml2.bst
- components/ostree.bst
- components/polkit.bst
- components/systemd-libs.bst
- components/xdg-dbus-proxy.bst
- components/xorg-lib-xau.bst

variables:
  meson-local: >-
    -Dgtkdoc=disabled
    -Dsystem_bubblewrap=bwrap
    -Ddconf=disabled
    -Dmalcontent=disabled
    -Dselinux_module=disabled
    -Dtests=false
    -Dsystem_dbus_proxy=xdg-dbus-proxy
