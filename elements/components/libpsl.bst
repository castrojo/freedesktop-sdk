# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libidn2.bst
- components/libunistring.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libpsl.so"

sources:
- kind: git_repo
  url: github:rockdaboot/libpsl.git
  track: '*.*.*'
  ref: 0.22.0-0-g43d9f4d1012b963e12b9124db9bc4101e8b7e3ae
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: 18ecca5d54471f21918798da451dd8d03a18f3c7
