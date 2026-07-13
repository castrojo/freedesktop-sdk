# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-gi-docgen.bst
- components/gobject-introspection.bst
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/libgcrypt.bst

variables:
  meson-local: >-
    -Dvapi=false
    -Dbash_completion=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/secret-tool'
        - '%{libdir}/libsecret-1.so'

sources:
- kind: git_repo
  url: gnome:libsecret.git
  track: '*.*.*'
  ref: 0.21.7-0-g0936f740c02b60f02657729cd99f581db4517a41
