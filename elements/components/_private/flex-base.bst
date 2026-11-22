# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst
- components/m4.bst
- components/tar.bst
- components/texinfo.bst

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      libfl:
      - '%{libdir}/libfl.so.*'
  cpe:
    product: flex

sources:
- kind: anitya
  project-id: 819
  url: github_files:westes/flex/releases/download/v{version}/flex-{version}.tar.gz
  ref:
    version: 2.7.3
    sha256sum: b18bbc3622b2b9ebecd0423f4e110adfad8db51d0c5ada3f26660c7cb7c735ec
- kind: patch
  path: patches/flex/flex-pie.patch
