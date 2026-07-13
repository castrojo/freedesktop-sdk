# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual
description: Creates a GL subdirectory, needed for the GL32 compat extension

variables:
  strip-binaries: ''

build-depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/GL"
