# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: libffi

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --without-gcc-arch

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libffi.so'

sources:
- kind: git_repo
  url: github:libffi/libffi.git
  track: v*
  exclude:
  - v*-rc*
  - "v*-dev*"
  ref: v3.8.2-0-gddd2fe13ee32da9b41fbcc68e03bf2854b25d1c5
