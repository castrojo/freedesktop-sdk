# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/debugedit-source.yml

build-depends:
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/base-sdk/xxhash.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/build/elfutils-build.bst
- bootstrap/build/file-stage1.bst

variables:
  local_ldflags: "-Wl,-rpath,%{tools}/lib"
