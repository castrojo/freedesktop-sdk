# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - iconvconfig --output=gconv-modules.cache

  install-commands:
  - install -Dm644 -t '%{install-root}%{libdir}/gconv' gconv-modules.cache
