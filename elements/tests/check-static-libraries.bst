# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- filename: sdk-image.bst
  config:
    location: /sysroot

- tests/check-static-libraries-config.bst
- utils/check-static-libraries.bst

config:
  commands:
  - |
    check-static-libraries /sysroot "%{datadir}/check-static-libraries/static_libraries_allow_list"
