# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gobject-introspection.bst
- components/libgudev.bst
- components/libimobiledevice.bst
- components/libusb.bst
- components/polkit-gobject.bst

sources:
- kind: git_repo
  url: freedesktop:upower/upower.git
  track: 'v*.*.*'
  ref: v1.91.4-0-gaf22b0bb6a97fff89b0e11101de9fc4937832864
