# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

(?):
- target_arch in ["riscv64"]:
    depends:
    - components/_private/opensbi-u-boot.bst
