# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --disable-gssapi

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtirpc.so'

sources:
- kind: anitya
  project-id: 1740
  url: sourceforge:projects/libtirpc/files/libtirpc/{version}/libtirpc-{version}.tar.bz2
  ref:
    version: 1.3.7
    sha256sum: b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702
