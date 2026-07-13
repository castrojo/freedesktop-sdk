# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/sed.bst

depends:
- public-stacks/runtime-minimal.bst
- components/itstool.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- components/python3.bst
- components/python3-pygments.bst

runtime-depends:
- components/python3-lxml.bst

variables:
  meson-local: >-
    -Dyelp_manual=false
    -Dtests=false

sources:
- kind: git_repo
  url: gnome:gtk-doc.git
  track: '*.*'
  ref: 1.36.1-0-g6d87f9b2dadc8977a000d7a66d98ac662fa803b7
