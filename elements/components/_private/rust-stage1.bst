# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

(?):
- target_arch == "x86_64":
    depends:
    - components/_private/rust-stage1-x86_64.bst
- target_arch == "i686":
    depends:
    - components/_private/rust-stage1-i686.bst
- target_arch == "aarch64":
    depends:
    - components/_private/rust-stage1-aarch64.bst
- target_arch == "ppc64le":
    depends:
    - components/_private/rust-stage1-powerpc64le.bst
- target_arch == "riscv64":
    depends:
    - components/_private/rust-stage1-riscv64.bst
- target_arch == "loongarch64":
    depends:
    - components/_private/rust-stage1-loongarch64.bst
