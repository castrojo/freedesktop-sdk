# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- components/systemd.bst

variables:
  networkd-config: "%{install-root}%{indep-libdir}/systemd/network/"
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm 644 -t "%{networkd-config}" 20-wired.network
    install -Dm 644 \
        -t "%{install-root}%{indep-libdir}/systemd/system-preset" \
        networkd.preset

sources:
- kind: local
  path: files/systemd-networkd
