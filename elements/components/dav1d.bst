# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/nasm.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Denable_tests=false
    -Dxxhash_muxer=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdav1d.so'

sources:
- kind: git_repo
  url: videolan:dav1d.git
  track: '*.*.*'
  ref: 1.5.3-0-gb546257f770768b2c88258c533da38b91a06f737
