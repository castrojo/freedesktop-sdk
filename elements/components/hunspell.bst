# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: |
    --with-readline \
    --with-ui

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhunspell-1.7.so'

sources:
- kind: git_repo
  url: github:hunspell/hunspell.git
  track: v*
  ref: v1.7.5-0-ge8342700b4dde06130cdbba75f7e6500ffa58864
