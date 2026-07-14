# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/dbus.bst
- components/glib.bst
- components/libgudev.bst
- components/libmbim.bst
- components/libqmi.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Dudevdir='%{indep-libdir}/udev'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmm-glib.so'

sources:
- kind: git_repo
  url: freedesktop:mobile-broadband/ModemManager.git
  track: '*.*.*'
  exclude:
  - '*-dev'
  ref: 1.24.2-0-gf2b9ab1ad78d322f32134a444b5b54c6e8160e19
