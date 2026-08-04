# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst
- components/fontconfig.bst
- components/fribidi.bst
- components/harfbuzz.bst
- components/json-glib.bst
- components/libthai.bst
- components/xorg-lib-xft.bst

variables:
  meson-local: >-
    -Ddocumentation=false
    -Dintrospection=enabled
    -Dbuild-testsuite=false
    -Dbuild-examples=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'
        - '%{libdir}/libpangoxft-1.0.so'

  cpe:
    ignored:
    - CVE-2019-1010238

sources:
- kind: git_repo
  url: gnome:pango.git
  track: '*.*.*'
  ref: 1.58.1-0-g758e8ad848c5b1b343faf4184117ec1c7eca5f5e
