# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/debugedit.bst
- components/curl.bst
- components/docbook-xsl.bst
- components/flatpak.bst
- components/fuse3.bst
- components/json-glib.bst
- components/libsoup.bst
- components/libyaml.bst
- components/xmlto.bst

runtime-depends:
- components/git-lfs.bst
- components/git.bst
- components/gzip.bst
- components/libarchive.bst
- components/tar.bst

variables:
  meson-local: >-
    -Dtests=false
    -Dfuse=3

sources:
- kind: git_repo
  url: github:flatpak/flatpak-builder.git
  track: 1.*[02468].*
  ref: 1.4.10-0-g152518cbabe19453ed8f4f7bbe8d7a24084d8db4
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: ccea836b799256420788c463a638ded0636b1632
