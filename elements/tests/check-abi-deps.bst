# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- tests/check-abi-config.bst

(?):
- target_arch == "i686":
    build-depends:
      (>):
      - abi/compat-x86_64.bst:utils/check-abi.bst
- target_arch != "i686":
    build-depends:
      (>):
      - utils/check-abi.bst

config:
  exclude:
  - debug
