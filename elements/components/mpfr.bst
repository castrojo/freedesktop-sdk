# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/gmp.bst

variables:
  make-args: >-
    MAKEINFO=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmpfr.so'

sources:
- kind: git_repo
  url: inria:mpfr/mpfr.git
  track: '*.*.*'
  exclude:
  - '*-rc*'
  ref: 4.2.2-0-geaa57b856d814af32f97d5e5eb129fb986235323
