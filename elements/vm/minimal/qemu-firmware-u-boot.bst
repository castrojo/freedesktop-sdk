# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- components/_private/u-boot-qemu.bst
- public-stacks/runtime-minimal.bst

config:
  commands:
  - install -Dm644 -t "%{install-root}" %{datadir}/u-boot/*/u-boot.bin
