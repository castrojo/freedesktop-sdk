# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

(?):
- target_arch == "riscv64":
    depends:
    - components/_private/u-boot-unmatched.bst
