# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunistring.so'

sources:
- kind: anitya
  project-id: 1747
  url: ftp_gnu_org:libunistring/libunistring-{version}.tar.xz
  ref:
    version: 1.4.2
    sha256sum: 5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a41499c
