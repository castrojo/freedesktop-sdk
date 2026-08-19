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
  ref: 0.23.3-0-gc486db8d221cbac55f87508d4da4db4497760997
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: e1b8015c3b2f0f4f8c18659c2480fc1a22c07b20
