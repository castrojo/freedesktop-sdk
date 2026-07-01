# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/libxcrypt-source.yml

build-depends:
- bootstrap/build/gcc-stage1.bst
- bootstrap/build/debug-utils.bst
- bootstrap/base-sdk/autoconf.bst
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

variables:
  conf-local: >-
    --enable-hashes=all
    --enable-obsolete-api=no
    --enable-obsolete-api-enosys=no

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcrypt.so'
