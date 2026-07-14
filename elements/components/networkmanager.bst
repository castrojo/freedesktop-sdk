# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- components/docbook-xsl.bst
- components/gobject-introspection.bst
- components/libxslt.bst
- components/perl.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
# Uses libuuid only
- components/util-linux-libs.bst
- components/systemd-libs.bst
- components/dbus.bst
- components/glib.bst
- components/gnutls.bst
- components/nss.bst
- components/libnvme.bst
- components/libpsl.bst
- components/curl.bst
- components/pygobject.bst
- components/libndp.bst
- components/audit.bst
- components/jansson.bst
- components/newt.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Diwd=true
    -Dpolkit=true
    -Dppp=false
    -Dmodem_manager=false
    -Dqt=false
    -Dtests=no

sources:
- kind: git_repo
  url: freedesktop:NetworkManager/NetworkManager.git
  track: '*.*.*'
  exclude:
  - "*-dev*"
  - "*-rc*"
  ref: 1.56.1-0-gb829f838fc5d8c93437faa5db44a5396b67893de
