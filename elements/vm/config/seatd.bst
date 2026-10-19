# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- public-stacks/runtime-minimal.bst
- components/libseat.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm644 seatd.preset "%{install-root}%{indep-libdir}/systemd/system-preset/40-seatd.preset"

sources:
- kind: local
  path: files/vm/seatd-config
