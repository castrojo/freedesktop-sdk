# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/python3.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 check-static-libraries.py '%{install-root}%{bindir}/check-static-libraries'

sources:
- kind: local
  path: utils/check-static-libraries.py
