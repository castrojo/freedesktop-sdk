# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libogg.bst
- components/openssl.bst
- components/opus.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopusfile.so'
        - '%{libdir}/libopusurl.so'

sources:
- kind: git_repo
  url: xiph:opusfile.git
  track: v*
  ref: v0.12-0-ga55c164e9891a9326188b7d4d216ec9a88373739
