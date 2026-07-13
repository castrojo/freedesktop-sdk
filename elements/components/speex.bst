# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libogg.bst
- components/speexdsp.bst

variables:
  conf-local: |
    --enable-binaries

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libspeex.so'

sources:
- kind: git_repo
  url: xiph:speex.git
  track: Speex-*
  ref: Speex-1.2.1-0-g5dceaaf3e23ee7fd17c80cb5f02a838fd6c18e01
