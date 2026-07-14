# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- public-stacks/runtime-minimal.bst
- components/_private/opensbi-u-boot.bst

config:
  commands:
  - install -Dm644 -t "%{install-root}" /usr/share/opensbi/lp64/generic/firmware/fw_payload.elf
