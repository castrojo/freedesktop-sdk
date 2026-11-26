# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libdevmapper.bst
- components/util-linux-libs.bst

sources:
- kind: anitya
  project-id: 2596
  url: ftp_gnu_org:parted/parted-{version}.tar.xz
  ref:
    version: 3.8
    sha256sum: a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63
