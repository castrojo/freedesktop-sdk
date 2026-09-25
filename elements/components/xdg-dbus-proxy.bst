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
  ref: 0.1.9-0-g72b40c8f6d9d585cfbdb249690724f740d207087
