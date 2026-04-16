# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

depends:
- components/systemd.bst

variables:
  journald-config: "%{install-root}%{indep-libdir}/systemd/journald.conf.d"
  strip-binaries: ''

config:
  install-commands:
  - |
    mkdir -p "%{journald-config}"
    install -m 644 -t "%{journald-config}" 99-volatile-journal.conf

sources:
- kind: local
  path: files/journald-config/99-volatile-journal.conf
