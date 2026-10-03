# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst
- components/asciidoctor.bst
- components/asciidoc.bst
- components/doctest.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst
- components/fmtlib.bst
- components/zstd.bst

variables:
  cmake-local: >-
    -DREDIS_STORAGE_BACKEND=OFF
    -DCCACHE_DEV_MODE=OFF
    -DENABLE_TESTING=OFF

sources:
- kind: git_repo
  url: github:ccache/ccache.git
  track: v*
  ref: v4.14.1-0-gc67954b7729c2a7a350c80e7634d704b669307dc
