# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gmp.bst

variables:
  # Work around race condition in makefiles. The following error
  # message sometimes happen:
  # /bin/sh: line 1: ./desdata: Text file busy
  notparallel: true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnettle.so'
        - '%{libdir}/libhogweed.so'

sources:
- kind: git_repo
  url: nettle:nettle.git
  track: nettle_*
  exclude:
  - nettle_*rc*
  ref: nettle_4.0_release_20260205-0-gbf13ee9e5024014cfa6d2fc097923afe087e63ba
