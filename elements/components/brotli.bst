# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/bc.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{bindir}/brotli"
        - "%{libdir}/libbrotlicommon.so"
        - "%{libdir}/libbrotlidec.so"
        - "%{libdir}/libbrotlienc.so"

sources:
- kind: git_repo
  url: github:google/brotli.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.2.1-0-gdb24a98aed38a16de78cc05ca15cdd8dc2a0d92d
