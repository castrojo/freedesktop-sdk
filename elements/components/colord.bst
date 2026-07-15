# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/systemd.bst
- components/vala.bst

depends:
- components/glib.bst
- components/lcms.bst
- components/libgudev.bst
- components/libgusb.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Dargyllcms_sensor=false
    -Dbash_completion=false
    -Dlibcolordcompat=false
    -Dman=false
    -Dvapi=true

sources:
- kind: git_repo
  url: github:hughsie/colord.git
  track: '*.*.*'
  ref: 1.4.8-0-ge3ee294acdc53d7f191e1090631d75f471e59d82
