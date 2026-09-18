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
- kind: tar
  url: sourceforge:projects/libtirpc/files/libtirpc/1.3.8/libtirpc-1.3.8.tar.bz2
  ref: 8839959bfcc7a0f4c609d8e4f53f1c67ae33de23775ec35beb39ff15adf11920
