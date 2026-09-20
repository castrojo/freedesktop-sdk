# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/elfutils.bst
- components/libbpf.bst
- components/zlib.bst

variables:
  cmake-local: >-
    -DLIBBPF_EMBEDDED=false

sources:
- kind: git_repo
  url: kernel:devel/pahole/pahole.git
  track: 'v*'
  ref: v1.32-0-gfa725d687ce3a712ef296b46bc63ea57ef466014
