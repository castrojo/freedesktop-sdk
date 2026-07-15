# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- filename: platform-image.bst
  config:
    location: /sysroot

- utils/find-rpath.bst

config:
  commands:
  - |
    find-rpath %{gcc_triplet} /sysroot
