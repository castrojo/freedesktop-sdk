# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

(?):
- target_arch == "x86_64":
    depends:
    - components/openjdk25-bootstrap-x86_64.bst

- target_arch == "aarch64":
    depends:
    - components/openjdk25-bootstrap-aarch64.bst

- target_arch == "ppc64le":
    depends:
    - components/openjdk25-bootstrap-ppc64le.bst

- target_arch == "riscv64":
    depends:
    - components/openjdk25-bootstrap-riscv64.bst
