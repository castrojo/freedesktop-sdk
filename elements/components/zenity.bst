# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/itstool.bst

depends:
- components/gtk3.bst

variables:
  meson-local: >-
    -Dlibnotify=false
    -Dwebkitgtk=false

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/help"

sources:
- kind: git_repo
  url: gnome:zenity.git
  track: '3.44.*'
  ref: 3.44.6-0-g2754f171bf9680edcb807be3707a688e5220299c
