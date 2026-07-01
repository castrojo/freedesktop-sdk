# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-minimal.bst

runtime-depends:
- bootstrap/binutils.bst
- components/python3.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 check-debug-crc.py '%{install-root}%{bindir}/check-debug-crc'

sources:
- kind: local
  path: utils/check-debug-crc.py
