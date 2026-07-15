# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst
- components/pkg-config.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"

config:
  configure-commands:
  - |
    sed -i "s/-Werror//g" Makefile

sources:
- kind: git_repo
  url: kernel:utils/dtc/dtc.git
  track: v*
  ref: v1.8.1-0-g8f48565e5cfedc74d3f7512f1e0188e9d85dc1de
