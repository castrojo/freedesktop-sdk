# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose
build-depends:
- cross-compilers/freedesktop-sdk-riscv64.bst:bootstrap/glibc.bst

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/riscv64-linux-gnu/**"
        - "%{indep-libdir}/riscv64-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
