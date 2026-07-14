# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/elfutils-source.yml

build-depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/zstd.bst

variables:
  conf-local: >-
    --disable-debuginfod
    --disable-libdebuginfod

  local_ldflags: "-Wl,-rpath,%{tools}/lib"
