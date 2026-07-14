# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/file-source.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/file-stage1.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/zlib-ng.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/zlib-ng.bst
- bootstrap/zstd.bst

variables:
  conf-local: >-
    --disable-libseccomp
    --disable-xzlib
    --disable-bzlib

  make: make 'FILE_COMPILE=%{tools}/bin/file'

config:
  configure-commands:
    (<):
    - autoreconf -ivf

  install-commands:
    (>):
    # Remove empty directory triggering BuildStream #647
    - |
      rm -rf "%{install-root}%{mandir}/man5"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmagic.so'
