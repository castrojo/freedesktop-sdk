# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/gcc-base.bst

runtime-depends:
- components/gcc-manifest.bst
- bootstrap/glibc.bst

config:
  include:
  - gcc-libs

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libasan.so'
        - '%{libdir}/libatomic.so'
        - '%{libdir}/libgcc_s.so'
        - '%{libdir}/libgfortran.so'
        - '%{libdir}/libgomp.so'
        - '%{libdir}/libhwasan.so'
        - '%{libdir}/libitm.so'
        - '%{libdir}/liblsan.so'
        - '%{libdir}/libobjc.so'
        - '%{libdir}/libquadmath.so'
        - '%{libdir}/libtsan.so'
        - '%{libdir}/libubsan.so'
        - '%{libdir}/libstdc++.so'
