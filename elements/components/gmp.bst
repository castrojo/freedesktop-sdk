# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  autogen: autoreconf -fvi
  conf-local: >-
    --enable-cxx
    --enable-fat

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/"
      mv "%{install-root}%{includedir}/gmp.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgmp.so'
        - '%{libdir}/libgmpxx.so'

sources:
- kind: tar
  url: ftp_gnu_org:gmp/gmp-6.3.0.tar.xz
  ref: a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898
- kind: patch
  path: patches/gmp/Complete-function-prototype-in-acinclude.m4-for-C23-.patch
