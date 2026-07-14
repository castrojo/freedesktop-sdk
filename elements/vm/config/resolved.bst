# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

depends:
- components/systemd.bst

variables:
  resolved-config: "%{install-root}%{sysconfdir}/systemd/"
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm 644 -t "%{resolved-config}" resolved.conf
    install -Dm 644 \
        -t "%{install-root}%{indep-libdir}/systemd/system-preset" \
        resolved.preset

public:
  bst:
    overlap-whitelist:
    - '%{sysconfdir}/systemd/resolved.conf'

sources:
- kind: local
  path: files/systemd-resolved
