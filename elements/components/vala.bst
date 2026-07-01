# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- components/_private/git-minimal.bst
- components/gobject-introspection.bst
- components/_private/vala-bootstrap.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst

variables:
  # vala can't find gee if build-dir is used
  build-dir: ''
  conf-local: --disable-valadoc
  make: make bootstrap
  local_flags: -fpermissive

sources:
- kind: git_repo
  # See https://wiki.gnome.org/Projects/Vala for last version
  url: gnome:vala.git
  # Note for updates: Stable minor versions are even.
  track: "*.*[02468].*"
  ref: 0.56.19-0-g159ed5597853e78bd983d29df33d23d34bde3830
