# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- utils/find-rpath.bst
- filename: platform-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    find-rpath %{gcc_triplet} /sysroot
