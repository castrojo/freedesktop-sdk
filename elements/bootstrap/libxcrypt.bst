# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/libxcrypt-source.yml

build-depends:
- bootstrap/base-sdk/autoconf.bst
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage1.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

- bootstrap/gnu-config.bst

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
