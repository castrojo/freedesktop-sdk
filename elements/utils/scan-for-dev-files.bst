# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/binutils.bst
- bootstrap/findutils.bst
- bootstrap/sed.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm755 scan-for-dev-files.sh '%{install-root}%{bindir}/scan-for-dev-files'

sources:
- kind: local
  path: utils/scan-for-dev-files.sh
