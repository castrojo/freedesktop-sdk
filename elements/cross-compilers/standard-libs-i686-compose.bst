# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- cross-compilers/freedesktop-sdk-i686.bst:bootstrap/glibc.bst

public:
  bst:
    split-rules:
      arch:
        - "%{includedir}/i386-linux-gnu/**"
        - "%{indep-libdir}/i386-linux-gnu/**"
        - "%{prefix}/lib*/ld-linux*.so.*"
        - "/lib*/ld-linux*.so.*"
