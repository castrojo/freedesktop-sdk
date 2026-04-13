# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/bash.bst
- bootstrap/coreutils.bst

runtime-depends:
- components/findutils.bst
- components/kmod.bst
- components/sed.bst
- components/systemd.bst
- components/tzdata.bst
- components/util-linux.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm 755 -t "%{install-root}%{bindir}" prepare-image.sh

sources:
- kind: local
  path: files/vm/prepare-image.sh
