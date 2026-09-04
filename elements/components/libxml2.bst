# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/python3-minimal.bst
- components/doxygen.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xz.bst
- bootstrap/zlib-ng.bst
- components/icu.bst

variables:
  conf-local: >-
    --with-icu
    --with-http
    --with-zlib
    --with-lzml
    --with-python
    CPPFLAGS="$(pkg-config --cflags-only-I python3)"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/xml2-config'
        - '%{libdir}/libxml2.so'
        - '%{libdir}/xml2Conf.sh'
  cpe:
    ignored:
    - CVE-2026-11979 # patched

sources:
- kind: git_repo
  url: gnome:libxml2.git
  track: v*
  ref: v2.15.4-0-g96498992efa48d52b0e8b83058bd88dbdaf153c1
- kind: patch
  path: patches/libxml2/CVE-2026-11979.patch
