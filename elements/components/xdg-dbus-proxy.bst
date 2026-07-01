# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dman=disabled

sources:
- kind: git_repo
  url: github:flatpak/xdg-dbus-proxy.git
  track: '*.*.*'
  ref: 0.1.7-0-g6a170fa77e3cbecb48f9dd2478fe5c0a119eb467
