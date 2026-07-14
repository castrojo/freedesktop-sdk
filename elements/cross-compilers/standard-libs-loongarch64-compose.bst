# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose
build-depends:
- cross-compilers/freedesktop-sdk-loongarch64.bst:bootstrap/glibc.bst

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/loongarch64-linux-gnu/**"
        - "%{indep-libdir}/loongarch64-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
