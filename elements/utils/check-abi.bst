# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-gnu.bst

runtime-depends:
- components/file.bst
- components/libabigail.bst
- components/python3-pyelftools.bst
- components/python3.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 check-abi.py '%{install-root}%{bindir}/check-abi'

sources:
- kind: local
  path: utils/check-abi.py
