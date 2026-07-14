# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gsettings-desktop-schemas.bst
- components/python3-gi-docgen.bst
- components/patchelf.bst
- components/vala.bst

depends:
- public-stacks/runtime-minimal.bst
- components/curl.bst
- components/duktape.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dtests=false
    -Drelease=true

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete
      patchelf --remove-rpath "%{install-root}%{libdir}/libproxy/libpxbackend-1.0.so"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libproxy.so'

sources:
- kind: git_repo
  url: github:libproxy/libproxy.git
  track: '*.*.*'
  ref: 0.5.12-0-g99da01926b1b1e303a4d2331bbd74bed424863e7
