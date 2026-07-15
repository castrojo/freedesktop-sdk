# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- filename: sdk-image.bst
  config:
    location: /sysroot

- tests/check-debug-config.bst
- utils/check-debug-crc.bst

config:
  commands:
  - |
    check-debug-crc --ignore-file "%{datadir}/check-debug/missing-debug-data-allowlist.json" /sysroot
