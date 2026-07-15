# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

description: |
  Provides ldd as a hierarchical tree to visualise direct and
  transitive resolutions. Add it to runtime-depends of any element.

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- components/gcc-libs.bst

variables:
  local_flags: -DDEFAULT_SEARCH_PATH='"%{libdir}"'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/libtree'

sources:
- kind: git_repo
  track: v*
  exclude:
  - "*rc*"
  url: github:haampie/libtree.git
  ref: v3.1.1-0-g1521dfe063284551b955958fd7deb3426fd75d84
- kind: patch
  path: patches/libtree/default-libdir.patch
