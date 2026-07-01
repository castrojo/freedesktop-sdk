# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: libffi

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libffi.so'

variables:
  conf-local: >-
    --without-gcc-arch

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_repo
  url: github:libffi/libffi.git
  track: v*
  exclude:
  - v*-rc*
  - "v*-dev*"
  ref: v3.6.0-0-gf6303b8b0dd6353c6a5bb4de2e855a13b86f22cf
