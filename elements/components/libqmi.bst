# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/help2man.bst

depends:
- public-stacks/runtime-minimal.bst
- components/bash-completion.bst
- components/glib.bst
- components/libgudev.bst
- components/libmbim.bst
- components/libqrtr-glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libqmi-glib.so'

sources:
- kind: git_repo
  url: freedesktop:mobile-broadband/libqmi.git
  track: '*.*.*'
  exclude:
  - '*-dev'
  ref: 1.38.0-0-ge3d79ed3f7fdc6a7fa8b374860b1c23a8f172812
