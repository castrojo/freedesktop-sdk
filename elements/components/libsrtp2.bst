# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Dpcap-tests=disabled
    -Dcrypto-library=openssl
    -Dcrypto-library-kdf=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsrtp2.so'

sources:
- kind: git_repo
  url: github:cisco/libsrtp.git
  track: v*.*.*
  ref: v2.8.0-0-g24b3bf8f19b6f5ab4cd2bcceb4f4064efca86fd5
