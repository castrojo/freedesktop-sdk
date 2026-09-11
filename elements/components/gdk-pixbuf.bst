# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-docutils.bst
- components/python3-gi-docgen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libglycin.bst
- components/shared-mime-info.bst

variables:
  meson-local: >
    -Dinstalled_tests=false
    -Dtests=false
    -Ddocumentation=true
    -Dandroid=disabled
    -Dgif=disabled
    -Djpeg=disabled
    -Dpng=disabled
    -Dtiff=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gdk-pixbuf-csource'
        - '%{bindir}/gdk-pixbuf-pixdata'
        - '%{bindir}/gdk-pixbuf-thumbnailer'
        - '%{libdir}/libgdk_pixbuf-2.0.so'

sources:
- kind: git_repo
  url: gnome:gdk-pixbuf.git
  track: 2.*[02468].*
  exclude:
  - '2.9*'
  ref: 2.44.8-0-g0bd66153abb6bd548febb82337db79cbefe694b0
