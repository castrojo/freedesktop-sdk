# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual
description: Creates VAAPI subdirectories, needed for VAAPI compat extensions

build-depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/dri/intel-vaapi-driver"
