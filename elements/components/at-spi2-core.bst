# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/dbus.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/libdbus.bst

variables:
  meson-local: >-
    -Dx11=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-1.0.so'
        - '%{libdir}/libatk-bridge-2.0.so'
        - '%{libdir}/libatspi.so'

  cpe:
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:at-spi2-core.git
  track: AT_SPI2_CORE_2_*[02468]_*
  ref: AT_SPI2_CORE_2_54_0-0-g2b2085e3bb98c35cfeaf33a9b2852c610c3a9b7b
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
