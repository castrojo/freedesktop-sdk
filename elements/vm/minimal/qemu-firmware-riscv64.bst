# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- components/_private/opensbi-u-boot.bst
- public-stacks/runtime-minimal.bst

config:
  commands:
  - install -Dm644 -t "%{install-root}" /usr/share/opensbi/lp64/generic/firmware/fw_payload.elf
